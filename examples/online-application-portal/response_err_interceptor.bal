// Copyright (c) 2024 WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/constraint;
import ballerina/http;

service class ResponseErrorInterceptor {
    *http:ResponseErrorInterceptor;

    remote function interceptResponseError(http:Request request, error err) returns ClientError|ServerError|error {
        string path = request.rawPath;
        string method = request.method;

        if err is constraint:Error {
            return <ClientError>{
                body: {
                    code: http:STATUS_BAD_REQUEST,
                    message: err.message(),
                    path: path,
                    method: method
                }
            };
        }

        if err is http:ClientRequestError {
            http:Detail responseDetails = err.detail();
            if responseDetails.statusCode == http:STATUS_BAD_REQUEST {
                GuidewireErrorPayload payload = check responseDetails.body.ensureType();
                return <ClientError>{
                    body: getResponsePayload(path, method, payload)
                };
            }
        }

        if err is http:RemoteServerError {
            http:Detail responseDetails = err.detail();
            if responseDetails.statusCode == http:STATUS_INTERNAL_SERVER_ERROR {
                GuidewireErrorPayload payload = check responseDetails.body.ensureType();
                return <ServerError>{
                    body: getResponsePayload(path, method, payload)
                };
            }
        }

        return <ServerError>{
            body: {
                code: http:STATUS_INTERNAL_SERVER_ERROR,
                message: err.message(),
                path: path,
                method: method
            }
        };
    }
}

function getResponsePayload(string path, string method, GuidewireErrorPayload payload) returns ErrorPayload {
    string? stacktrace = payload.stackTrace;
    return {
        code: payload.code,
        message: stacktrace is () ? payload.message : string `${payload.message}:${stacktrace}`,
        path: path,
        method: method
    };
}
