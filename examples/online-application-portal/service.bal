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

service /portal on new http:Listener(9090) {
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
    resource function get applications(string? customerId = (), string? continuationId = (), string? 'limit = ()) returns insnow:ListApplication|error {
        return self.insuranceNow->/applications(
            customerId = customerId, 
            continuationId = continuationId, 
            'limit = 'limit
        );
    }

    # Starts a new QuickQuote or Quote.
    # 
    # + quote - The insurance quote
    # + requestedTypeCd - The type of the quote, QuickQuote or Quote
    # + return - An error or nil
    resource function post applications(insnow:Quote quote, string? requestedTypeCd = ()) returns error? {
        _ = check self.insuranceNow->/applications.post(quote, requestedTypeCd);
    }

    # Adds an attachment to a quote or application.
    # 
    # + applicationId - System identifier of the application
    # + attachment - The attachment
    # + return - An error or nil
    resource function post [string applicationId]/documents(insnow:Attachment attachment) returns error? {
        _ = check self.insuranceNow->/applications/[applicationId]/documents.post(attachment);
    }

    # Converts a quote to an application.
    # 
    # + applicationId - System identifier of the application
    # + return - An error or nil
    resource function post [string applicationId]/convert() returns error? {
        _ = check self.insuranceNow->/applications/[applicationId]/bindRequest.post;
    }
}
