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

import ballerina/http;
import ballerinax/guidewire.insnow;

configurable string guidewireDomain = ?;
configurable string username = ?;
configurable string password = ?;

service ApplicationPortal /portal on new http:Listener(9090) {
    private final insnow:Client insuranceNow;

    function init() returns error? {
        self.insuranceNow = check new ({auth: {username, password}}, string `https://${guidewireDomain}/coreapi/v5`);
    }

    # Retrieves the list of previously saved insurance applications.
    #
    # + customerId - The filter parameter for customer
    # + continuationId - Indicates the starting offset for the API results
    # + limit - The maximum number of results to return
    # + return - List of applications or an error
    resource function get applications(string? customerId = (), string? continuationId = (), string? 'limit = ()) returns insnow:ListApplication|ClientError|ServerError {
        do {
            insnow:ListApplication|error response = self.insuranceNow->/applications(
                customerId = customerId, continuationId = continuationId, 'limit = 'limit
            );
            if response is insnow:ListApplication {
                return response;
            }

            if response is http:ClientRequestError {
                http:Detail responseDetails = response.detail();
                if responseDetails.statusCode == http:STATUS_BAD_REQUEST {
                    GuidewireErrorPayload payload = check responseDetails.body.ensureType();
                    return <ClientError>{
                        body: getResponsePayload("/applications", "get", payload)
                    };
                }
            }

            if response is http:RemoteServerError {
                http:Detail responseDetails = response.detail();
                if responseDetails.statusCode == http:STATUS_INTERNAL_SERVER_ERROR {
                    GuidewireErrorPayload payload = check responseDetails.body.ensureType();
                    return <ServerError>{
                        body: getResponsePayload("/applications", "get", payload)
                    };
                }
            }

            return <ServerError>{
                body: {
                    code: http:STATUS_INTERNAL_SERVER_ERROR,
                    message: response.message(),
                    path: "/applications",
                    method: "get"
                }
            };
        } on fail error err {
            return <ServerError>{
                body: {
                    code: http:STATUS_INTERNAL_SERVER_ERROR,
                    message: err.message(),
                    path: "/applications",
                    method: "get"
                }
            };
        }
    }

    # Starts a new QuickQuote or Quote.
    #
    # + quote - The insurance quote
    # + requestedTypeCd - The type of the quote, QuickQuote or Quote
    # + return - An error or nil
    resource function post applications(insnow:Quote quote, string? requestedTypeCd = ()) returns ClientError|ServerError? {
        do {
            http:Response response = check self.insuranceNow->/applications.post(quote, requestedTypeCd);
            if isSuccesfulResponse(response.statusCode) {
                return;
            }
            GuidewireErrorPayload payload = check extractErrorResponse(response);
            if payload.code == http:STATUS_BAD_REQUEST {
                return <ClientError>{
                    body: getResponsePayload("/applications", "post", payload)
                };
            } else {
                return <ServerError>{
                    body: getResponsePayload("/applications", "post", payload)
                };
            }
        } on fail error err {
            return <ServerError>{
                body: {
                    code: http:STATUS_INTERNAL_SERVER_ERROR,
                    message: err.message(),
                    path: "/applications",
                    method: "post"
                }
            };
        }
    }

    # Adds an attachment to a quote or application.
    #
    # + applicationId - System identifier of the application
    # + attachment - The attachment
    # + return - An error or nil
    resource function post applications/[string applicationId]/documents(insnow:Attachment attachment) returns ClientError|ServerError? {
        do {
            http:Response response = check self.insuranceNow->/applications/[applicationId]/documents.post(attachment);
            if isSuccesfulResponse(response.statusCode) {
                return;
            }
            GuidewireErrorPayload payload = check extractErrorResponse(response);
            if payload.code == http:STATUS_BAD_REQUEST {
                return <ClientError>{
                    body: getResponsePayload(string `/applications/${applicationId}/documents`, "post", payload)
                };
            } else {
                return <ServerError>{
                    body: getResponsePayload(string `/applications/${applicationId}/documents`, "post", payload)
                };
            }
        } on fail error err {
            return <ServerError>{
                body: {
                    code: http:STATUS_INTERNAL_SERVER_ERROR,
                    message: err.message(),
                    path: string `/applications/${applicationId}/documents`,
                    method: "post"
                }
            };
        }
    }

    # Converts a quote to an application.
    #
    # + applicationId - System identifier of the application
    # + return - An error or nil
    resource function post applications/[string applicationId]/convert() returns ClientError|ServerError? {
        do {
            http:Response response = check self.insuranceNow->/applications/[applicationId]/bindRequest.post;
            if isSuccesfulResponse(response.statusCode) {
                return;
            }
            GuidewireErrorPayload payload = check extractErrorResponse(response);
            if payload.code == http:STATUS_BAD_REQUEST {
                return <ClientError>{
                    body: getResponsePayload(string `/applications/${applicationId}/convert`, "post", payload)
                };
            } else {
                return <ServerError>{
                    body: getResponsePayload(string `/applications/${applicationId}/convert`, "post", payload)
                };
            }
        } on fail error err {
            return <ServerError>{
                body: {
                    code: http:STATUS_INTERNAL_SERVER_ERROR,
                    message: err.message(),
                    path: string `/applications/${applicationId}/convert`,
                    method: "post"
                }
            };
        }
    }
}

function isSuccesfulResponse(int statusCode) returns boolean {
    return statusCode >= 200 && statusCode < 300;
}

function extractErrorResponse(http:Response response) returns GuidewireErrorPayload|error {
    return (check response.getJsonPayload()).fromJsonWithType();
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
