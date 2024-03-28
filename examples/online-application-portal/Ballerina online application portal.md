# Ballerina online application portal

The Online Application Portal, powered by Guidewire InsuranceNow cloud API, is a user-friendly platform designed to simplify the process of applying for insurance coverage. Whether users are seeking auto, home, health, or any other type of insurance, the portal offers a seamless experience from start to finish.

Key functionalities include:

- Create new insurance quotes or applications
- Attach documents to the Insurance Applications
- List previously saved applications
- Convert insurance quotes into applications

## Prerequisites

### 1. Setup Guidewire InsuranceNow account

Refer to the [Setup guide](https://central.ballerina.io/ballerinax/guidewire.insnow/latest#setup-guide) to set up your Guidewire InsuranceNow account, if you do not have one.

### 2. Configuration

Update your Guidewire InsuranceNow account-related configurations in the `Config.toml` file in the example root directory:

```toml
guidewireDomain = "<domain>"
username = "<username>"
password = "<password>"
```

## Run the example

Execute the following command to run the example:

```ballerina
bal run
```
