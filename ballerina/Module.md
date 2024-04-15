## Overview

[Guidewire InsuranceNow](https://www.guidewire.com/products/insurancenow) is a cloud-based insurance platform offering comprehensive tools for policy, billing, and claims management, designed to streamline operations and improve customer service in the insurance industry.

The `ballerinax/guidewire.insnow` package provides a client API to connect to Guidewire InsuranceNow cloud API using Ballerina.

The Ballerina Guidewire InsuranceNow connector is compatible with the Guidewire InsuranceNow [`2023.3 (Innsbruck)`](https://docs.guidewire.com/cloud/in/20233/apiref/) REST API version.

## Setup guide

To use the Ballerina Guidewire InsuranceNow connector, access to the Guidewire API is required. Access is granted to partners or customers of the Guidewire platform. To become a partner or customer, reach out to Guidewire's sales team via the [Guidewire website](https://www.guidewire.com/contact-us/). For detailed instructions on obtaining authentication/authorization keys, please go through the [portal development guide](https://docs.guidewire.com/cloud/in/20233/portaldev/PortalDevelopment/topics/c_overview_portal_development.html).

## Quickstart

To use the Guidewire InsuranceNow connector in your Ballerina application, modify the `.bal` file as follows:

### Step 1: Import the module

Import `ballerinax/guidewire.insnow` module into your Ballerina project.

```ballerina
import ballerinax/guidewire.insnow;
```

### Step 2: Instantiate a new connector

Create an `insnow:Client` object with your domain URL and relevant authentication options.

```ballerina
configurable string username = ?;
configurable string password = ?;

insnow:ConnectionConfig insnowConfig = {
    auth: {
        username,
        password
    }
};

insnow:Client insuranceNow = check new (insnowConfig, "https://<your-domain>/coreapi/v5");
```

### Step 3: Invoke the connector operations

Now, utilize the available connector operations.

#### List applications

```ballerina
insnow:ListApplication applications = check insuranceNow->/applications();
```

#### Create application

```ballerina
insnow:Attachment attachment = {
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
```

### Step 4: Run the Ballerina application

```Shell
bal run
```

## Examples

The Guidewire InsuranceNow connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-guidewire.insnow/tree/main/examples/), covering the following use cases:

1. [Online application portal](https://github.com/ballerina-platform/module-ballerinax-guidewire.insnow/tree/main/examples/online-application-portal) - Implement an online insurance application portal using Guidewire InsuranceNow cloud API.
