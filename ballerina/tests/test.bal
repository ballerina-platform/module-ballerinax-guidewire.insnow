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
import ballerina/log;
import ballerina/os;
import ballerina/test;

configurable boolean isLiveServer = os:getEnv("IS_LIVE_SERVER") == "true";

configurable string username = isLiveServer ? os:getEnv("INSNOW_USERNAME") : "test";
configurable string password = isLiveServer ? os:getEnv("INSNOW_PASSWORD") : "test";
configurable string serviceUrl = isLiveServer ? os:getEnv("INSNOW_URL") : "http://localhost:9090";

Client insuranceNow = check initClient();

function initClient() returns Client|error {
    if isLiveServer {
        log:printInfo("Running tests on actual server");
    } else {
        log:printInfo("Running tests on mock server");
    }
    return new ({auth: {username, password}}, serviceUrl);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testListApplications() returns error? {
    ListApplication applications = check insuranceNow->/applications();
    test:assertTrue(applications.continuationId !is (), "[continuationId] not present in the list application response");
    test:assertTrue(applications.applicationListItems !is (), "[applicationListItems] not present in the list application response");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testCreateApplication() returns error? {
    Quote quote = {
        _links: [
            {
                href: "/api/resource/123",
                rel: "self"
            }
        ],
        _revision: "1",
        applicationInfo: {
            correctedByTransactionNumber: 12345,
            correctionOfTransactionNumber: 12344,
            id: "app-001",
            iterationDescription: "Initial submission",
            needByDt: "2020-01-01",
            reinstatedByTransactionNumber: 12346,
            reinstatementOfTransactionNumber: 12347,
            renewalApplyOfTransactionNumber: 12348
        },
        basicPolicy: {
            affinityGroupCd: "GRP001",
            auditPayPlan: {
                auditPayPlanCd: "PLAN001",
                electronicPaymentSource: {
                    achBankAccountNumber: "000123456789",
                    achBankAccountTypeCd: "Checking",
                    achBankName: "Bank of Example",
                    achExceptionMsg: "None",
                    achName: "John Doe",
                    achRoutingNumber: "011000015",
                    achStandardEntryClassCd: "PPD",
                    agentTrustInd: false,
                    carrierCd: "CARRIER001",
                    creditCardNumber: "4111111111111111",
                    creditCardTypeCd: "Visa",
                    customerPaymentProfileId: "CUST-001",
                    customerProfileId: "CUST-PROFILE-001",
                    id: "PAY-001",
                    methodCd: "ACH",
                    midasId: "MIDAS-001",
                    partyInfo: {
                        addresses: [
                            {
                                id: "1",
                                addr1: "123 Example St",
                                city: "Exampletown",
                                postalCode: "12345",
                                stateProvCd: "EX",
                                regionCd: "USA",
                                regionISOCd: "USA",
                                addrTypeCd: "permanent",
                                verificationHash: "sdfdf"
                            }
                        ],
                        emailInfo: {
                            emailAddr: "john.doe@example.com"
                        },
                        id: "PARTY-001",
                        nameInfo: {
                            givenName: "John",
                            surname: "Doe"
                        },
                        partyTypeCd: "Individual"
                    },
                    paymentServiceAccountId: "PAY-SVC-001",
                    reminderDt: "2020-01-10",
                    sourceName: "Online Portal",
                    sourceTypeCd: "Online",
                    statusCd: "Active"
                },
                id: "AUDITPAY-001",
                payPlanTemplateIdRef: "TEMPLATE-001",
                paymentDay: "15"
            },
            autoDataPrefillInd: true,
            branch: "Main",
            businessSourceCd: "Online",
            cALineSelectedInd: true,
            cAPolicyType: "Type1",
            effectiveDt: "2020-01-01",
            effectiveTm: "12:00:00",
            expirationDt: "2021-01-01",
            id: "POLICY-001",
            inceptionDt: "2020-01-01",
            inceptionTm: "12:00:00"
        },
        contacts: [
            {
                contactTypeCd: "Agent",
                id: "CNT-001",
                partyInfo: {
                    addresses: [
                        {
                            id: "2",
                            regionCd: "USA",
                            regionISOCd: "USA",
                            addr1: "456 Agent Ave",
                            city: "Agentsville",
                            postalCode: "67890",
                            stateProvCd: "AG",
                            addrTypeCd: "permanent",
                            verificationHash: "sdfdf"
                        }
                    ],
                    emailInfo: {
                        emailAddr: "agent.name@agency.com"
                    },
                    id: "PARTY-AGT-001",
                    nameInfo: {
                        givenName: "Agent",
                        surname: "Name"
                    },
                    partyTypeCd: "Agency"
                },
                preferredDeliveryMethod: "Email",
                status: "Active"
            }
        ],
        customerRef: "CUST-REF-001",
        description: "Sample policy for demonstration",
        externalStateData: "External data example",
        id: "POLICY-EXAMPLE-001",
        insured: {
            entityTypeCd: "Corporation",
            id: "INSURED-001",
            indexName: "Insured Corporation",
            partyInfo: [
                {
                    addresses: [
                        {
                            id: "3",
                            addr1: "456 Agent Ave",
                            city: "Agentsville",
                            postalCode: "67890",
                            stateProvCd: "AG",
                            regionCd: "USA",
                            regionISOCd: "USA",
                            addrTypeCd: "permanent",
                            verificationHash: "sdfdf"
                        }
                    ],
                    businessInfo: {
                        businessTypeCd: "S-Corp",
                        id: "BUS-INFO-001",
                        natureOfBusiness: "Software Development",
                        yearsInBusiness: "10"
                    },
                    emailInfo: {
                        emailAddr: "info@insuredcorp.com"
                    },
                    id: "PARTY-INS-001",
                    nameInfo: {
                        commercialName: "Insured Corporation"
                    },
                    partyTypeCd: "Corporation"
                }
            ],
            preferredDeliveryMethod: "Email",
            selfInsured: false,
            temporaryAddressOverrideInd: false,
            yearsInBusiness: 10
        },
        lockTaskId: "LOCK-001",
        policyRef: "POLICY-REF-001",
        statementAccountRef: "STATEMENT-ACC-001",
        status: "NewSubmission",
        submitterIssues: [
            {
                id: "ISSUE-001",
                msg: "Address verification needed",
                subTypeCd: "Verification",
                typeCd: "Warning"
            }
        ],
        transactionInfo: {
            cancelTypeCd: "None",
            id: "TRANS-001",
            newPolicyEffectiveDt: "2020-01-01",
            newPolicyExpirationDt: "2021-01-01",
            paymentAmt: "1000.00",
            paymentTypeCd: "Initial",
            transactionCd: "NewBusiness",
            transactionEffectiveDt: "2020-01-01",
            transactionNumber: 1
        },
        vipLevel: "Gold",
        wcAdditionalInsureds: [],
        wcCoveredStates: [
            {
                stateCd: "IN",
                status: "Active",
                totalManualPremiumAmt: "500.00"
            }
        ]
    };
    _ = check insuranceNow->/applications.post(quote);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testAttachDocument() returns error? {
    Attachment attachment = {
        compositeFile: [
            {
                fileName: "insurance_application_form.pdf",
                id: "comp-app-form-001"
            }
        ],
        description: "Application and supporting documents for auto insurance policy.",
        filename: "complete_insurance_application_bundle.pdf",
        id: "doc-789456",
        linkReferences: [
            {
                description: "Link to customer's policy.",
                id: "link-policy-456789",
                idRef: "policy-123456",
                modelName: "CustomerPolicy",
                status: "Pending",
                systemIdRef: "gw-insurance-system-001"
            }
        ],
        tags: [
            {
                id: "tag-policy-application",
                name: "Policy Application",
                tagTemplateIdRef: "template-policy-app"
            },
            {
                id: "tag-auto-insurance",
                name: "Auto Insurance",
                tagTemplateIdRef: "template-auto-ins"
            }
        ],
        templateId: "template-insurance-application"
    };
    _ = check insuranceNow->/applications/["123"]/documents.post(attachment);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testConvertQuoteToApplication() returns error? {
    _ = check insuranceNow->/applications/["123"]/bindRequest.post;
}
