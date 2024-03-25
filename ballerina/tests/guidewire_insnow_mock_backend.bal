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
    
    resource function get applications(string? applicationOrQuoteNumber, string? continuationId, string? createdSinceDate, string? customerId, boolean? includeClosed, boolean? includeDeleted, string? 'limit, string? optionalFields, string? policyId, string? providerId, boolean? recentlyViewed, string? status, string? transactionCd, string? transactionCdGroup, string? 'type) returns ListApplication {
        return {
            "applicationListItems": [
                {
                    "_links": [
                        {
                            "href": "/example/link/to/application",
                            "rel": "self"
                        }
                    ],
                    "applicationMini": {
                        "_links": [
                            {
                                "href": "/example/link/to/application/details",
                                "rel": "details"
                            }
                        ],
                        "applicationInfo": {
                            "addDt": "2019-08-24",
                            "addTm": "10:30am",
                            "addUser": "admin",
                            "closeComment": "Application processed successfully",
                            "closeDt": "2019-09-24",
                            "closeReasonCd": "processed",
                            "closeSubReasonCd": "N/A",
                            "closeSubReasonLabel": "N/A",
                            "closeTm": "04:30pm",
                            "closeUser": "system",
                            "correctedByTransactionNumber": 0,
                            "correctionOfTransactionNumber": 0,
                            "firstMailedDt": "2019-08-25",
                            "id": "abcd1234",
                            "iterationDescription": "Initial submission",
                            "lastMailedDt": "2019-09-01",
                            "masterQuoteRef": "quote123",
                            "needByDt": "2019-09-30",
                            "pendForReleaseInd": false,
                            "reinstatedByTransactionNumber": 0,
                            "reinstatementOfTransactionNumber": 0,
                            "renewalApplyInd": false,
                            "renewalApplyOfTransactionNumber": 0,
                            "submittedDt": "2019-08-24",
                            "updateDt": "2019-08-25",
                            "updateTm": "11:00am",
                            "updateUser": "user123"
                        },
                        "applicationNumber": "app123",
                        "auditAccountRef": "audit456",
                        "basicPolicy": {
                            "affinityGroupCd": "group123",
                            "autoDataPrefillInd": true,
                            "branch": "branch001",
                            "businessSourceCd": "online",
                            "cALineSelectedInd": false,
                            "cAPolicyType": "type001",
                            "cCLineSelectedInd": true,
                            "cCPolicyType": "type002",
                            "cCSubline": "sublineA",
                            "cGLineSelectedInd": false,
                            "cILineSelectedInd": true,
                            "cLLineSelectedInd": false,
                            "cPLineSelectedInd": true,
                            "cPPolicyType": "type003",
                            "cancelDt": "2020-08-24",
                            "carrierCd": "carrierXYZ",
                            "carrierGroupCd": "groupXYZ",
                            "changeDt": "2019-09-01",
                            "commCLUERequestInd": true,
                            "comments": "Initial policy setup",
                            "companyProductCd": "product789",
                            "controllingStateCd": "CA",
                            "dPLineSelectedInd": false,
                            "description": "Basic policy setup for example",
                            "directorsAndOfficersLineSelectedInd": false,
                            "displayDescription": "Example Policy",
                            "effectiveDt": "2019-10-01",
                            "effectiveTm": "12:01am",
                            "employmentAndPracticeLineSelectedInd": false,
                            "errorsAndOmissionLineSelectedInd": true,
                            "expirationDt": "2020-10-01",
                            "expiringFeeAmt": "50",
                            "expiringPremiumAmt": "200",
                            "extendedCoverageInd": true,
                            "externalId": "ext789",
                            "finalPremiumAmt": "250",
                            "fireLightningInd": false,
                            "fullTermAmt": "300",
                            "gLLineSelectedInd": true,
                            "id": "policy123",
                            "inceptionDt": "2019-10-01",
                            "inceptionTm": "12:01am",
                            "latestTerm": "term1",
                            "latestTermTransaction": "trans123",
                            "legacyPolicyNumber": "legacy001",
                            "llcOwnedDt": "2019-08-24",
                            "lossSettlementType": "settle001",
                            "manualReinstateInd": false,
                            "manualReinstateReason": "",
                            "manualRenewalInd": false,
                            "manualRenewalReason": "",
                            "namedNonOwnedInd": false,
                            "nonRenewInd": false,
                            "originalApplicationRef": "origApp001",
                            "pLLineSelectedInd": true,
                            "payPlanCd": "plan001",
                            "paymentDay": "1st",
                            "policyDisplayNumber": "disp123",
                            "policyNumber": "pol123",
                            "policySource": "agent",
                            "policyType": "standard",
                            "policyVersion": "001",
                            "previousCarrierCd": "prevCarrier",
                            "previousExpirationDt": "2018-10-01",
                            "previousPolicyNumber": "prev123",
                            "previousPremium": "150",
                            "productTypeCd": "typeABC",
                            "productVersionIdRef": "ver001",
                            "programCd": "prog123",
                            "promotionCd": "promo001",
                            "providerRef": "providerABC",
                            "quoteNumber": "quoteABC",
                            "quoteNumberLookup": "lookup123",
                            "ratedInd": true,
                            "reinstateDt": "2019-09-10",
                            "renewalPolicyRef": "renew123",
                            "renewalProviderRef": "providerXYZ",
                            "renewalSubProducerCd": "subProd123",
                            "renewalTermCd": "termABC",
                            "renewedFromPolicyRef": "renewFrom001",
                            "replacedByPolicyRef": "replace001",
                            "rewriteFromPolicyRef": "rewrite001",
                            "rewritePolicyRef": "rewriteABC",
                            "sessionLink": "sessionLink123",
                            "shellPolicyInd": false,
                            "sicCode": "sic789",
                            "statusCd": "active",
                            "subProducerCd": "subProd456",
                            "subTypeCd": "subType123",
                            "transactionCd": "transABC",
                            "transactionHistory": [],
                            "transactionNumber": 0,
                            "transactionStatus": "pending",
                            "underwriterCd": "underwrite789",
                            "underwritingHoldInd": false,
                            "vandalismMaliciousMischiefInd": false,
                            "writtenFeeAmt": "30",
                            "writtenPremiumAmt": "220"
                        },
                        "customerRef": "cust123",
                        "description": "Application for new policy",
                        "exportFilename": "export123.txt",
                        "id": "miniApp123",
                        "insured": {
                            "entityTypeCd": "Individual",
                            "id": "12345",
                            "indexName": "John Doe",
                            "partyInfo": [
                                {
                                    "addresses": [
                                        {
                                            "addition": "Apt 101",
                                            "additionalLegal": "Legal description here",
                                            "addr1": "123 Main St",
                                            "addr2": "Suite 101",
                                            "addr3": "",
                                            "addr4": "",
                                            "addrTypeCd": "ContactAddr",
                                            "addressHash": "hashcode123",
                                            "attention": "Jane Doe",
                                            "barcodeDigits": "1234567890",
                                            "block": "Block 3",
                                            "carrierRoute": "C001",
                                            "city": "Anytown",
                                            "congressCode": "123",
                                            "county": "Anycounty",
                                            "countyCode": "001",
                                            "dpv": "Y",
                                            "dpvDesc": "Deliverable",
                                            "dpvNotes": "",
                                            "dpvNotesDesc": "",
                                            "geocodeLevel": "4",
                                            "geocodeLevelDescription": "Full match",
                                            "id": "addr123",
                                            "latitude": "40.712776",
                                            "legalDesc": "Legal description of property",
                                            "longitude": "-74.005974",
                                            "lot": "5",
                                            "meridian": "W",
                                            "plssCounty": "001",
                                            "postDirectional": "N",
                                            "postalCode": "10001",
                                            "preDirectional": "S",
                                            "primaryMeridian": "Meridian description",
                                            "primaryNumber": "123",
                                            "primaryNumberSuffix": "A",
                                            "range": "Range description",
                                            "rangeDir": "E",
                                            "regionCd": "US-NY",
                                            "regionISOCd": "US",
                                            "score": "100",
                                            "secondaryDesignator": "Apartment",
                                            "secondaryNumber": "101",
                                            "section": "Section 1",
                                            "stateProvCd": "NY",
                                            "streetName": "Main",
                                            "suffix": "St",
                                            "township": "Township 1",
                                            "townshipDir": "N",
                                            "validated": "true",
                                            "verificationHash": "verify123",
                                            "verificationMsg": "Address verified"
                                        }
                                    ],
                                    "businessInfo": {
                                        "annualPayrollAmt": "500000",
                                        "annualSalesAmt": "1000000",
                                        "businessInfoCd": "ContactBusiness",
                                        "businessTypeCd": "SMB",
                                        "id": "biz123",
                                        "natureBusinessCd": "Retail",
                                        "natureOfBusiness": "Electronics Retail",
                                        "numberEmployees": "15",
                                        "yearsInBusiness": "10"
                                    },
                                    "emailInfo": {
                                        "emailAddr": "johndoe@example.com",
                                        "emailTypeCd": "ContactEmail",
                                        "id": "email123",
                                        "preferredInd": true
                                    },
                                    "eraseInfo": {
                                        "erasedBy": "Admin",
                                        "erasedDt": "2020-01-01",
                                        "erasedInd": false,
                                        "erasedTm": "12:00",
                                        "id": "erase123"
                                    },
                                    "id": "party123",
                                    "issues": [
                                        {
                                            "attributeRefs": [],
                                            "id": "issue123",
                                            "msg": "Missing documentation",
                                            "subTypeCd": "Documentation",
                                            "typeCd": "Compliance"
                                        }
                                    ],
                                    "locationIdRef": "location123",
                                    "nameInfo": {
                                        "commercialName": "Doe Electronics",
                                        "commercialName2": "Doe & Co.",
                                        "dbaIndexName": "DoeElectronics",
                                        "dbaName": "Doe Electronics, Inc.",
                                        "extendedName": "",
                                        "givenName": "John",
                                        "id": "name123",
                                        "indexName": "Doe, John",
                                        "nameTypeCd": "ContactName",
                                        "otherGivenName": "Johnny",
                                        "positionCd": "Owner",
                                        "prefixCd": "Mr.",
                                        "shortName": "John Doe",
                                        "suffixCd": "",
                                        "surname": "Doe"
                                    },
                                    "partyTypeCd": "ContactParty",
                                    "personInfo": {
                                        "age": 40,
                                        "ageLicensed": 22,
                                        "bestTimeToContact": "Afternoon",
                                        "bestWayToContact": "Email",
                                        "birthDt": "1980-05-15",
                                        "educationCd": "College",
                                        "employerCd": "Self",
                                        "genderCd": "Male",
                                        "id": "person123",
                                        "maritalStatusCd": "Married",
                                        "occupationCd": "BusinessOwner",
                                        "occupationClassCd": "ClassA",
                                        "personTypeCd": "ContactPersonal",
                                        "positionTitle": "CEO",
                                        "yearsLicensed": 18
                                    },
                                    "phoneInfo": [
                                        {
                                            "id": "phone123",
                                            "phoneName": "Mobile",
                                            "phoneNumber": "555-123-4567",
                                            "phoneTypeCd": "ContactPhone",
                                            "preferredInd": true
                                        }
                                    ],
                                    "taxInfo": {
                                        "fein": "123-45-6789",
                                        "id": "tax123",
                                        "legalEntityCd": "Corp",
                                        "received1099Ind": false,
                                        "receivedW9Ind": true,
                                        "required1099Ind": false,
                                        "ssn": "",
                                        "taxIdTypeCd": "FEIN",
                                        "taxTypeCd": "ContactTaxInfo",
                                        "withholdingExemptInd": false
                                    },
                                    "underLyingPartyInfoIdRef": "under123",
                                    "underLyingPolicyIdRef": "policy123",
                                    "yearsOfService": 5
                                }
                            ],
                            "preferredDeliveryMethod": "Email",
                            "ratingBureauID": "RB123",
                            "selfInsured": false,
                            "temporaryAddressOverrideInd": false,
                            "wcNAICS": "443142",
                            "wcNCCIRiskIdNumber": "NCCI123",
                            "wcSIC": "SIC123",
                            "websiteAddress": "www.doeelectronics.com",
                            "yearsInBusiness": 10
                        }
                    },
                    "canEdit": true,
                    "canInquiry": true,
                    "currentOwner": "owner123",
                    "customerInfo": {
                        "customerNumber": "custNum123",
                        "customerRef": "custRef123",
                        "id": "custInfo123",
                        "name": "John Doe"
                    },
                    "productInfo": {
                        "id": "prod123",
                        "name": "Insurance Product A"
                    },
                    "ref": "ref123"
                }
            ],
            "continuationId": "cont123"
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

    resource function get applications/[string systemId]/documents() returns ListDocument {
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

    resource function get applications/[string systemId]/documents/[string documentId]/content() returns byte[] {
        return [];
    }

    resource function get applications/[string systemId]/drivers(string? continuationId, boolean? includeDeleted, string? 'limit, "Driver"|"NonDriver"? typeCd) returns ListDriver {
        
    }

    resource function post applications/[string systemId]/drivers(@http:Payload Driver payload) returns http:Created {
        return http:CREATED;
    }

    // resource function get applications/[string systemId]/drivers/[int:Signed32 driverNumber]() returns Driver {
    // }

    resource function put applications/[string systemId]/drivers/[int:Signed32 driverNumber](@http:Payload Driver payload) returns Driver {
        return payload;
    }

    resource function delete applications/[string systemId]/drivers/[int:Signed32 driverNumber]() returns http:Ok {
        return http:OK;
    }

    resource function patch applications/[string systemId]/drivers/[int:Signed32 driverNumber](@http:Payload Driver payload) returns Driver {
        return payload;
    }

    // resource function get applications/[string systemId]/lines(string? continuationId, string? 'limit) returns ListDriver {
    // }

    // resource function get claims/[string systemId]/documents() returns ListDocument {
    // }

    resource function post claims/[string systemId]/documents(@http:Payload DocumentDetail payload) returns http:Created {
        return http:CREATED;
    }

    // resource function get claims/[string systemId]/notes() returns ListNote {
    // }

    resource function post claims/[string systemId]/notes(@http:Payload NoteDetail payload) returns http:Created {
        return http:CREATED;
    }

    // resource function get policies(string? continuationId, string? createdSinceDate, string? customerId, string? expiredDateAfter, boolean? includePriorTerms, string? 'limit, string? optionalFields, string? policyNumber, string? providerRef, boolean? recentlyViewed, string? status) returns ListPolicy|BadRequestError|InternalServerErrorError {
    // }

    // resource function get policies/[string systemId](string? asOfDate) returns PolicyDetails|BadRequestError|InternalServerErrorError {
    // }

    resource function patch policies/[string systemId](@http:Payload PolicyDetails payload) returns PolicyDetails {
        return payload;
    }
}
