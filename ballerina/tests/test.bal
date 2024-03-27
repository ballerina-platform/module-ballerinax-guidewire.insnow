// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com).
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

import ballerina/os;
import ballerina/log;

configurable boolean isLiveServer = os:getEnv("IS_LIVE_SERVER") == "true";

configurable string username = isLiveServer ? os:getEnv("INSNOW_USERNAME") : "test";
configurable string password = isLiveServer ? os:getEnv("INSNOW_PASSWORD") : "test";
configurable string serviceUrl = isLiveServer ? os:getEnv("INSNOW_URL") : "http://localhost:9090";

Client insuranceNow = check initClient();

function initClient() returns Client|error {
    if (isLiveServer) {
        log:printInfo("Running tests on actual server");
    } else {
        log:printInfo("Running tests on mock server");
    }
    return new (serviceUrl);
}

