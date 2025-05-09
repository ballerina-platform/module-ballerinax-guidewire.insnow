# Ballerina Guidewire InsuranceNow connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-guidewire.insnow/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-guidewire.insnow/actions/workflows/ci.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-guidewire.insnow.svg)](https://github.com/ballerina-platform/module-ballerinax-guidewire.insnow/commits/master)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/guidewire.insnow.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%guidewire.insnow)

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

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 17. You can download it from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Generating the client using OpenAPI tool

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/openapi.yml --mode client --license docs/license.txt -o ballerina
```

Note: The license year is hardcoded to 2024, change if necessary.

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`guidewire.insnow` package](https://lib.ballerina.io/ballerinax/guidewire.insnow/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
