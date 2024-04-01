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
import ballerina/time;
import ballerinax/guidewire.insnow;

type ApplicationPortal service object {
    *http:InterceptableService;

    resource function get applications(string? customerId = (), string? continuationId = (), string? 'limit = ()) returns insnow:ListApplication|error;
    resource function post applications(insnow:Quote quote, string? requestedTypeCd = ()) returns error?;
    resource function post applications/[string applicationId]/documents(insnow:Attachment attachment) returns error?;
    resource function post applications/[string applicationId]/convert() returns error?;
};

type GuidewireErrorPayload record {|
    int code;
    string message;
    string stackTrace?;
|};

type ErrorPayload record {|
    int code;
    string message;
    string path;
    string method;
    string timeStamp = time:utcToString(time:utcNow());
|};

type ClientError record {|
    *http:BadRequest;
    ErrorPayload body;
|};

type ServerError record {|
    *http:InternalServerError;
    ErrorPayload body;
|};
