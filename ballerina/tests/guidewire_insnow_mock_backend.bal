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

import ballerina/http;

listener http:Listener ep0 = new (9090, config = {host: "localhost"});

service / on ep0 {

    resource function get addresses/countries("asc"|"desc" sortType = "asc") returns ListCountry {
        return {
            countries: [
                {
                    isoCd: "AU",
                    name: "Australia"
                },
                {
                    isoCd: "CA",
                    name: "Canada"
                },
                {
                    isoCd: "FR",
                    name: "France"
                },
                {
                    isoCd: "DE",
                    name: "Germany"
                },
                {
                    isoCd: "JP",
                    name: "Japan"
                },
                {
                    isoCd: "GB",
                    name: "United Kingdom"
                },
                {
                    isoCd: "US",
                    name: "United States of America"
                }
            ]
        };
    }
    
    resource function get addresses/countries/[string isoCd]() returns AddressCountryTemplate {
        return {
            addressLines: "2",
            addressStateProvinceTemplates: {
                stateProvinces: [
                    {
                        id: "CA",
                        stateProvName: "California"
                    },
                    {
                        id: "NY",
                        stateProvName: "New York"
                    }
                ]
            },
            cityLabel: "City",
            countryName: "United States of America",
            format: "Line1, Line2, City, State, Postal Code",
            id: "US",
            postalCodeExamples: "12345, 12345-6789",
            postalCodeLabel: "ZIP Code",
            postalCodeRegex: "^[0-9]{5}(?:-[0-9]{4})?$",
            requiredFields: "addressLines, city, stateProv, postalCode",
            stateProvLabel: "State"
        };
    }

    resource function get addresses/googlePlacesFill(string? addressLine, string? placeId) returns Address {
        return {
            addition: "Apt 501",
            additionalLegal: "Legal description of the property goes here",
            addr1: "1600 Amphitheatre Parkway",
            addr2: "Building B",
            addr3: "",
            addr4: "",
            addrTypeCd: "ContactAddr",
            addressHash: "abcd1234efgh5678ijkl",
            attention: "John Doe",
            barcodeDigits: "123456789",
            block: "",
            carrierRoute: "C001",
            city: "Mountain View",
            congressCode: "CA-18",
            county: "Santa Clara",
            countyCode: "085",
            dpv: "Y",
            dpvDesc: "Deliverable",
            dpvNotes: "",
            dpvNotesDesc: "",
            geocodeLevel: "street",
            geocodeLevelDescription: "Exact match",
            id: "uniqueId123",
            latitude: "37.4220",
            legalDesc: "Lot 4, Block 9, GooglePlex Subdivision",
            longitude: "-122.0841",
            lot: "4",
            meridian: "",
            plssCounty: "",
            postDirectional: "",
            postalCode: "94043",
            preDirectional: "",
            primaryMeridian: "",
            primaryNumber: "1600",
            primaryNumberSuffix: "",
            range: "",
            rangeDir: "",
            regionCd: "United States",
            regionISOCd: "US",
            score: "100",
            secondaryDesignator: "Apt",
            secondaryNumber: "501",
            section: "",
            stateProvCd: "CA",
            streetName: "Amphitheatre Parkway",
            suffix: "Pkwy",
            township: "",
            townshipDir: "",
            validated: "true",
            verificationHash: "hashValue123456",
            verificationMsg: "Address verified successfully"
        };
    }

    resource function post addresses/isVerifiedRequest(@http:Payload Address payload) returns http:Ok {
        return http:OK;
    }

    resource function post addresses/verificationRequest(@http:Payload ListAddress payload, "Combined"|"Uncombined" addressType = "Combined") returns http:Ok {
        return http:OK;
    }
    
    resource function get applications(string? applicationOrQuoteNumber, string? continuationId, string? createdSinceDate, string? customerId, boolean? includeClosed, boolean? includeDeleted, string? 'limit, string? optionalFields, string? policyId, string? providerId, boolean? recentlyViewed, string? status, string? transactionCd, string? transactionCdGroup, string? 'type) returns json {
        return {
            applicationListItems: [
                {
                    _links: [
                        {
                            href: "/example/link/to/application",
                            rel: "self"
                        }
                    ],
                    applicationMini: {
                        _links: [
                            {
                                href: "/example/link/to/application/details",
                                rel: "details"
                            }
                        ],
                        applicationInfo: {
                            addDt: "2019-08-24",
                            addTm: "10:30am",
                            addUser: "admin",
                            closeComment: "Application processed successfully",
                            closeDt: "2019-09-24",
                            closeReasonCd: "processed",
                            closeSubReasonCd: "N/A",
                            closeSubReasonLabel: "N/A",
                            closeTm: "04:30pm",
                            closeUser: "system",
                            correctedByTransactionNumber: 0,
                            correctionOfTransactionNumber: 0,
                            firstMailedDt: "2019-08-25",
                            id: "abcd1234",
                            iterationDescription: "Initial submission",
                            lastMailedDt: "2019-09-01",
                            masterQuoteRef: "quote123",
                            needByDt: "2019-09-30",
                            pendForReleaseInd: false,
                            reinstatedByTransactionNumber: 0,
                            reinstatementOfTransactionNumber: 0,
                            renewalApplyInd: false,
                            renewalApplyOfTransactionNumber: 0,
                            submittedDt: "2019-08-24",
                            updateDt: "2019-08-25",
                            updateTm: "11:00am",
                            updateUser: "user123"
                        },
                        applicationNumber: "app123",
                        auditAccountRef: "audit456",
                        basicPolicy: {
                            affinityGroupCd: "group123",
                            autoDataPrefillInd: true,
                            branch: "branch001",
                            businessSourceCd: "online",
                            cALineSelectedInd: false,
                            cAPolicyType: "type001",
                            cCLineSelectedInd: true,
                            cCPolicyType: "type002",
                            cCSubline: "sublineA",
                            cGLineSelectedInd: false,
                            cILineSelectedInd: true,
                            cLLineSelectedInd: false,
                            cPLineSelectedInd: true,
                            cPPolicyType: "type003",
                            carrierCd: "carrierXYZ",
                            carrierGroupCd: "groupXYZ",
                            commCLUERequestInd: true,
                            comments: "Initial policy setup",
                            companyProductCd: "product789",
                            controllingStateCd: "CA",
                            dPLineSelectedInd: false,
                            description: "Basic policy setup for example",
                            directorsAndOfficersLineSelectedInd: false,
                            displayDescription: "Example Policy",
                            effectiveDt: "2019-10-01",
                            effectiveTm: "12:01am",
                            employmentAndPracticeLineSelectedInd: false,
                            errorsAndOmissionLineSelectedInd: true,
                            expirationDt: "2020-10-01",
                            extendedCoverageInd: true,
                            externalId: "ext789",
                            fireLightningInd: false,
                            gLLineSelectedInd: true,
                            id: "policy123",
                            inceptionDt: "2019-10-01",
                            inceptionTm: "12:01am",
                            legacyPolicyNumber: "legacy001",
                            llcOwnedDt: "2019-08-24",
                            lossSettlementType: "settle001",
                            pLLineSelectedInd: true,
                            payPlanCd: "plan001",
                            paymentDay: "1st",
                            policySource: "agent",
                            policyType: "standard",
                            previousCarrierCd: "prevCarrier",
                            previousExpirationDt: "2018-10-01",
                            previousPolicyNumber: "prev123",
                            previousPremium: "150",
                            productTypeCd: "typeABC",
                            productVersionIdRef: "ver001",
                            programCd: "prog123",
                            promotionCd: "promo001",
                            providerRef: "providerABC",
                            renewalProviderRef: "providerXYZ",
                            renewalSubProducerCd: "subProd123",
                            renewalTermCd: "termABC",
                            sessionLink: "sessionLink123",
                            sicCode: "sic789",
                            subProducerCd: "subProd456",
                            subTypeCd: "subType123",
                            transactionCd: "transABC",
                            transactionHistory: [],
                            transactionNumber: 0,
                            transactionStatus: "pending",
                            underwriterCd: "underwrite789",
                            underwritingHoldInd: false,
                            vandalismMaliciousMischiefInd: false
                        }
                    },
                    canEdit: true,
                    canInquiry: true,
                    currentOwner: "owner123",
                    customerInfo: {
                        customerNumber: "custNum123",
                        customerRef: "custRef123",
                        id: "custInfo123",
                        name: "John Doe"
                    },
                    productInfo: {
                        id: "prod123",
                        name: "Insurance Product A"
                    },
                    ref: "ref123"
                }
            ],
            continuationId: "cont123"
        };
    }

    resource function post applications(string? requestedTypeCd, @http:Payload Quote payload) returns http:Created {
        return http:CREATED;
    }

    resource function delete applications/[string systemId]() returns http:Ok {
        return http:OK;
    }

    resource function post applications/[string systemId]/bindRequest() returns http:Created {
        return http:CREATED;
    }

    resource function post applications/[string systemId]/convertToQuoteRequest() returns http:Created {
        return http:CREATED;
    }

    resource function get applications/[string systemId]/documents() returns json {
        return {
            documentListItems: [
                {
                    _links: [
                        {
                            href: "/documents/12345",
                            rel: "self"
                        }
                    ],
                    addDt: "2021-07-21",
                    addTm: "14:45:30",
                    addUser: "adminUser",
                    canDeleteInd: true,
                    canViewInd: true,
                    deliveryCd: "EMAIL",
                    description: "Policy renewal documentation for client.",
                    documentTypeCd: "POLICY_RENEWAL",
                    filename: "Policy_Renewal_12345.pdf",
                    formCd: "RENEWAL2021",
                    itemDescription: "Renewal package for policy 12345",
                    itemName: "Renewal Document",
                    name: "Policy Renewal Document",
                    outputNumber: "56789",
                    ref: "POL12345REN",
                    templateIdRef: "TEMPLATE_RENEWAL",
                    transactionNumber: "TX123456789",
                    'type: "Renewal"
                }
            ]
        };
    }

    resource function post applications/[string systemId]/documents(@http:Payload Attachment payload) returns http:Created {
        return http:CREATED;
    }

    resource function delete applications/[string systemId]/documents/[string documentId]() returns http:NoContent {
        return http:NO_CONTENT;
    }

    resource function post applications/[string systemId]/drivers(@http:Payload Driver payload) returns http:Created {
        return http:CREATED;
    }

    resource function put applications/[string systemId]/drivers/[int:Signed32 driverNumber](@http:Payload Driver payload) returns Driver {
        return payload;
    }

    resource function delete applications/[string systemId]/drivers/[int:Signed32 driverNumber]() returns http:Ok {
        return http:OK;
    }

    resource function patch applications/[string systemId]/drivers/[int:Signed32 driverNumber](@http:Payload Driver payload) returns Driver {
        return payload;
    }

    resource function get claims/[string systemId]/documents() returns json {
        return {
            documentListItems: [
                {
                    _links: [
                        {
                            href: "/documents/12345",
                            rel: "self"
                        }
                    ],
                    addDt: "2021-07-21",
                    addTm: "14:35:00",
                    addUser: "adminUser",
                    canDeleteInd: true,
                    canViewInd: true,
                    deliveryCd: "EML",
                    description: "Insurance Policy Document",
                    documentTypeCd: "POLICY_DOC",
                    filename: "policy_12345.pdf",
                    formCd: "POL_FORM_01",
                    itemDescription: "2021 Full Coverage Policy Document",
                    itemName: "Full Coverage Policy",
                    name: "Policy Document for John Doe",
                    outputNumber: "OUT1234567",
                    ref: "REF1234567",
                    templateIdRef: "TPL12345",
                    transactionNumber: "TXN1234567",
                    'type: "PDF"
                }
            ]
        };
    }

    resource function post claims/[string systemId]/documents(@http:Payload DocumentDetail payload) returns http:Created {
        return http:CREATED;
    }

    resource function get claims/[string systemId]/notes() returns ListNote {
        return {
            noteListItems: [
                {
                    addDt: "2022-08-30",
                    addTm: "09:45:00",
                    addUser: "user123",
                    comments: "Follow-up required for policy renewal",
                    description: "Policy Renewal Follow-up",
                    memo: "Ensure to discuss the new premium rates and benefits.",
                    priorityCd: "HIGH",
                    ref: "POLICY123456",
                    status: "OPEN",
                    stickyInd: true,
                    templateId: "NOTE_TEMPLATE_01"
                }
            ]
        };
    }

    resource function post claims/[string systemId]/notes(@http:Payload NoteDetail payload) returns http:Created {
        return http:CREATED;
    }

    resource function get policies(string? continuationId, string? createdSinceDate, string? customerId, string? expiredDateAfter, boolean? includePriorTerms, string? 'limit, string? optionalFields, string? policyNumber, string? providerRef, boolean? recentlyViewed, string? status) returns json {
        return {
            continuationId: "cont123456789",
            policyListItems: [
                {
                    _links: [
                        {
                            href: "/api/policy/details/123456",
                            rel: "self"
                        }
                    ],
                    customerInfo: {
                        customerNumber: "cust123456",
                        customerRef: "custRef123456",
                        id: "123456",
                        name: "John Doe"
                    },
                    policyMini: {
                        _links: [
                            {
                                href: "/api/policy/documents/123456",
                                rel: "documents"
                            }
                        ],
                        accountRef: "accRef123456",
                        auditAccountRef: "auditAcc123456",
                        basicPolicy: {
                            affinityGroupCd: "AG001",
                            autoDataPrefillInd: true,
                            branch: "MainBranch",
                            businessSourceCd: "Online",
                            cALineSelectedInd: true,
                            cAPolicyType: "Comprehensive",
                            cCLineSelectedInd: true,
                            cCPolicyType: "Collision",
                            cCSubline: "Standard",
                            cGLineSelectedInd: true,
                            cILineSelectedInd: true,
                            cLLineSelectedInd: true,
                            cPLineSelectedInd: true,
                            cPPolicyType: "CustomPolicyType",
                            carrierCd: "CarrierCode123",
                            carrierGroupCd: "CarrierGroup123",
                            commCLUERequestInd: true,
                            comments: "This is a test policy.",
                            companyProductCd: "CompProd123",
                            controllingStateCd: "CA",
                            dPLineSelectedInd: true,
                            description: "Basic auto insurance policy.",
                            directorsAndOfficersLineSelectedInd: true,
                            displayDescription: "Auto Insurance Policy",
                            effectiveDt: "2022-09-01",
                            effectiveTm: "12:01am",
                            employmentAndPracticeLineSelectedInd: true,
                            errorsAndOmissionLineSelectedInd: true,
                            expirationDt: "2023-09-01",
                            extendedCoverageInd: true,
                            externalId: "EXT123456",
                            fireLightningInd: true,
                            gLLineSelectedInd: true,
                            id: "Pol123456",
                            inceptionDt: "2022-09-01",
                            inceptionTm: "12:01am",
                            legacyPolicyNumber: "LegacyNum123",
                            llcOwnedDt: "2022-08-24",
                            lossSettlementType: "ActualCashValue",
                            manualBillingEntitySplitInd: true,
                            manualReinstateInd: true,
                            manualReinstateReason: "Customer request",
                            manualRenewalInd: true,
                            manualRenewalReason: "Under review",
                            namedNonOwnedInd: true,
                            oldSubTypeCd: "OldSubType123",
                            pLLineSelectedInd: true,
                            payPlanCd: "Monthly",
                            paymentDay: "15",
                            policySource: "Agent",
                            policyType: "Auto",
                            previousCarrierCd: "PrevCarrier123",
                            previousExpirationDt: "2021-09-01",
                            previousPolicyNumber: "PrevPol123",
                            previousPremium: "480",
                            productTypeCd: "Auto",
                            productVersionIdRef: "ProdVer123",
                            programCd: "Standard",
                            promotionCd: "Promo123",
                            providerRef: "ProvRef123",
                            renewalProviderRef: "RenewProv123",
                            renewalSubProducerCd: "RenewSubProd123",
                            renewalTermCd: "RenewTerm123",
                            sessionLink: "SessionLink123",
                            sicCode: "SIC123",
                            subProducerCd: "SubProd123",
                            subTypeCd: "SubType123",
                            transactionCd: "Trans123",
                            transactionHistory: [],
                            transactionNumber: 123,
                            transactionStatus: "Pending",
                            underwriterCd: "UWC123",
                            underwritingHoldInd: false,
                            vandalismMaliciousMischiefInd: false,
                            wcARDRuleEnabled: false,
                            wcAnniversaryRatingDay: "2022-09-01",
                            wcPremiumDiscountTableTypeCd: "TableType1"
                        },
                        customerRef: "CustRef123",
                        externalSystemInd: "Yes",
                        iVANSCheck: "Passed",
                        id: "PolicyID123456",
                        insured: {
                            entityTypeCd: "Individual",
                            id: "InsuredID123",
                            indexName: "John Doe"
                        },
                        statementAccountRef: "StatementAcc123",
                        systemId: "SysID123",
                        version: "1.0",
                        vipLevel: "Gold"
                    },
                    productInfo: {
                        id: "ProdInfo123",
                        name: "Auto Insurance"
                    },
                    ref: "Ref123456789"
                }
            ]
        };
    }

    resource function get policies/[string systemId](string? asOfDate) returns json {
        return {
            _links: [
                {
                    href: "/api/policies/123456789",
                    rel: "details"
                }
            ],
            _revision: "1",
            accountRef: "ACC123456789",
            auditAccountRef: "AUDIT123456789",
            basicPolicy: {
                affinityGroupCd: "GRP123",
                auditPayPlan: {
                    auditPayPlanCd: "MONTHLY",
                    electronicPaymentSource: {
                        achBankAccountNumber: "1234567890",
                        achBankAccountTypeCd: "CHECKING",
                        achBankName: "Bank of API",
                        achExceptionMsg: "Test",
                        achName: "John Doe",
                        achRoutingNumber: "111000025",
                        achStandardEntryClassCd: "PPD",
                        action: "PAY",
                        agentTrustInd: false,
                        carrierCd: "CARRIER123",
                        creditCardAuthorizationCd: "AUTH123",
                        creditCardAuthorizationMessage: "Authorized",
                        creditCardExpirationMonth: "12",
                        creditCardExpirationYr: "2024",
                        creditCardHolderName: "John Doe",
                        creditCardNumber: "4111111111111111",
                        creditCardSecurityCd: "123",
                        creditCardTypeCd: "VISA",
                        customerPaymentProfileId: "CUST_PAY_PROFILE_123",
                        customerProfileId: "CUST_PROFILE_123",
                        id: "ELECT_PAY_SRC_123",
                        methodCd: "ELECTRONIC",
                        midasId: "MIDAS123",
                        partyInfo: {
                            addresses: [
                                {
                                    addition: "Suite 123",
                                    additionalLegal: "Legal Description 123",
                                    addr1: "123 API Street",
                                    addr2: "Apt 456",
                                    addr3: "Floor 7",
                                    addr4: "Building 8",
                                    addrTypeCd: "PRIMARY",
                                    addressHash: "HASH123",
                                    attention: "John Doe",
                                    barcodeDigits: "123456",
                                    block: "Block123",
                                    carrierRoute: "Route123",
                                    city: "API City",
                                    congressCode: "CONG123",
                                    county: "API County",
                                    countyCode: "COUNTY123",
                                    dpv: "DPV123",
                                    dpvDesc: "Deliverable",
                                    dpvNotes: "Note123",
                                    dpvNotesDesc: "Delivery Point Validation Notes",
                                    geocodeLevel: "HIGH",
                                    geocodeLevelDescription: "Exact match",
                                    id: "ADDR123",
                                    latitude: "37.7749",
                                    legalDesc: "Legal Description 123",
                                    longitude: "-122.4194",
                                    lot: "Lot123",
                                    meridian: "Meridian123",
                                    plssCounty: "PLSS123",
                                    postDirectional: "N",
                                    postalCode: "94103",
                                    preDirectional: "S",
                                    primaryMeridian: "PrimaryMeridian123",
                                    primaryNumber: "123",
                                    primaryNumberSuffix: "A",
                                    range: "Range123",
                                    rangeDir: "E",
                                    regionCd: "Region123",
                                    regionISOCd: "US",
                                    score: "100",
                                    secondaryDesignator: "Apt",
                                    secondaryNumber: "456",
                                    section: "Section123",
                                    stateProvCd: "CA",
                                    streetName: "API Street",
                                    suffix: "St",
                                    township: "Township123",
                                    townshipDir: "N",
                                    validated: "true",
                                    verificationHash: "VERIFY123",
                                    verificationMsg: "Verified"
                                }
                            ],
                            emailInfo: {
                                emailAddr: "johndoe@example.com",
                                emailTypeCd: "PRIMARY",
                                id: "EMAIL123",
                                preferredInd: true
                            }
                        }
                    }
                }
            }
        };
    }

    resource function patch policies/[string systemId](@http:Payload PolicyDetails payload) returns PolicyDetails {
        return payload;
    }
}
