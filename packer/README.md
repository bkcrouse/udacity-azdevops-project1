# Building an Ubuntu azure image with packer

This repository contains an automation workflow to build a base Ubuntu image within an Azure account.

### Requirements

- An Azure account
- Packer 1.7.8
- Azure client utilities
- The GNU `make` utility
- Ensure that you have created a service principal

    ```bash
        az ad sp create-for-rbac --role Contributor --query "{ client_id: appId, client_secret: password, tenant_id: tenant }"
    ```
- This repo is configured to be ran from a linux or mac; however, tested under WSL2 with the appropriate utilities installed.

### Procedure

1. Configure you environment with the appropriate environment variables prior to running `make`.

1. To build the image, run:

    ```bash
        $ make build
    ```

This will validate the builder json file, and run the build, creating the resource group `default: packer-rg` and the base image.

1. To remove the created resource group and all objects within, run: `make clean`

## Resources

- [Packer Documnetation for Azure](https://www.packer.io/docs/builders/azure/arm)
- [Build Linux Image with Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/build-image-with-packer)
