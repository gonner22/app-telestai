# Ledger Telestai Application

This application automates the process of creating a Ledger device app for our Telestai cryptocurrency. It utilizes a Docker container to simplify this process, allowing users to:

- Easily compile their app for the desired Ledger device.
- Install the Telestai  app directly onto their chosen device.

Ledger devices such as Nano S, NanoS+, Ledger Stax or Ledger Flex are supported.

**Please note that the Ledger Nano X does not currently support sideloading, so it is not compatible with this application.**

## Quick access links:
- [Linux Installation Instructions](#linux-installation-instructions)
- [Windows Installation Instructions](#windows-installation-instructions)
- [macOS Installation Instructions](#macos-installation-instructions)


## Linux Installation Instructions

#### Pre-requisites
- Install and configure
  - :information_source: Docker: https://docs.docker.com/engine/install. Note: user must be able to run Docker without `sudo` (https://docs.docker.com/engine/install/linux-postinstall/)
  - :information_source: It is assumed you have [Python](https://www.python.org/downloads/) installed on your computer.
  - :information_source: Having trouble connecting your USB device? Check out this link for help: https://support.ledger.com/article/115005165269-zd?redirect=false

> **Warning**
> - To ensure data protection, users must back up their Ledger device recovery seeds before using this application. TLS is not responsible for any failures or issues that may arise. 
While the app has been tested on some devices, we rely on community feedback to validate its functionality on others, including the Ledger Flex and Stax.
> - This repository contains a submodule, and should therefore be cloned with the appropriate command: 

1. Clone the repository app-telestai.
```bash 
git clone https://github.com/Telestai-Project/app-telestai --recurse-submodules
```
2. Navigate into the cloned directory.
```bash
cd app-telestai
```
3. To begin developing, first connect your Ledger device to your PC and unlock it. Ensure it's displayed on the dashboard (not within another app). 
Then, execute the following command to download the necessary image and enter the container. The container will be located at the "/app" path.

   **Please note that all Ledger devices are compatible except for the Nano X, which is not currently supported due to technical limitations of Ledger.**

```bash
docker run --rm -ti  -v "$(realpath .):/app" --privileged -v "/dev/bus/usb:/dev/bus/usb" --user root ghcr.io/telestai-project/ledger-app-builder-legacy:latest
```
4. You can choose which device to compile for by setting the BOLOS_SDK environment variable to the following values:

- Nano S
```bash
BOLOS_SDK=$NANOS_SDK
```
- NANO S+
```bash
BOLOS_SDK=$NANOSP_SDK
```
- NANO Flex
```bash
BOLOS_SDK=$FLEX_SDK
```
- NANO Stax
```bash
BOLOS_SDK=$STAX_SDK
```
5. To compile and load the app, run the following command within the container:

```bash
make load
```
6. The user should review their device screen and confirm when prompted.

   **If everything was successful and no errors appeared on your computer screen, a new app called "Telestai" will appear in the main menu of your device.**

## Windows Installation Instructions
**(with PowerShell)**

#### Pre-requisites
- Install and configure
  - :information_source: Docker: https://docs.docker.com/engine/install.
  - :information_source: It is assumed you have [Python](https://www.python.org/downloads/) installed on your computer.
  - :information_source: Go to the official Git download page: https://git-scm.com/downloads
  - :information_source: Ensure your PowerShell execution policy permits script execution: https://go.microsoft.com/fwlink/?LinkID=135170
  - :information_source: Having trouble connecting your USB device? Check out this link for help: https://support.ledger.com/article/115005165269-zd?redirect=false

> **Warning**
> - To ensure data protection, users must back up their Ledger device recovery seeds before using this application. TLS is not responsible for any failures or issues that may arise. 
While the app has been tested on some devices, we rely on community feedback to validate its functionality on others, including the Ledger Flex and Stax.
> - This repository contains a submodule, and should therefore be cloned with the appropriate command: 

1. Clone the repository app-telestai.
```bash 
git clone https://github.com/Telestai-Project/app-telestai --recurse-submodules
```
2. Navigate into the cloned directory.
```bash
cd app-telestai
```
3. To begin developing, first connect your Ledger device to your PC and unlock it. Ensure it's displayed on the dashboard (not within another app). 
Then, execute the following command to download the necessary image and enter the container. The container will be located at the "/app" path.

   **Please note that all Ledger devices are compatible except for the Nano X, which is not currently supported due to technical limitations of Ledger.**

```bash
docker run --rm -ti --privileged -v "$(Get-Location):/app" ghcr.io/telestai-project/ledger-app-builder-legacy:latest
```

4. You can choose which device to compile for by setting the BOLOS_SDK environment variable to the following values:

- Nano S
```bash
BOLOS_SDK=$NANOS_SDK
```
- NANO S+
```bash
BOLOS_SDK=$NANOSP_SDK
```
- NANO Flax
```bash
BOLOS_SDK=$FLAX_SDK
```
- NANO Stax
```bash
BOLOS_SDK=$STAX_SDK
```

5. To compile the app, run the following command within the container:

```bash
make
```
   **If everything was successful and no errors appeared on your computer screen.**

6. Run these commands on your host from the app's source folder once you have built the app for the device you want:

```shell
# Install Python virtualenv
python -m pip install virtualenv 
# Create the 'ledger' virtualenv
python -m virtualenv ledger
```

Enter the Python virtual environment

`.\ledger\Scripts\activate.ps1`

```shell
# Install Ledgerblue (tool to load the app)
python -m pip install ledgerblue 
# Load the app.
python -m ledgerblue.runScript --scp --fileName bin/app.apdu --elfFile bin/app.elf
```

7. The user should review their device screen and confirm when prompted.

   **A new app called "Telestai" will appear in the main menu of your device.**

## macOS Installation Instructions

#### Pre-requisites
- Install and configure
  - :information_source: Docker: https://docs.docker.com/engine/install.
  - :information_source: It is assumed you have [Python](https://www.python.org/downloads/) installed on your computer.
  - :information_source: Go to the official Git download page: https://git-scm.com/downloads.
  - :information_source: Having trouble connecting your USB device? Check out this link for help: https://support.ledger.com/article/115005165269-zd?redirect=false

> **Warning**
> - To ensure data protection, users must back up their Ledger device recovery seeds before using this application. TLS is not responsible for any failures or issues that may arise. 
While the app has been tested on some devices, we rely on community feedback to validate its functionality on others, including the Ledger Flex and Stax.
> - This repository contains a submodule, and should therefore be cloned with the appropriate command: 

1. Clone the repository app-telestai.
```bash 
git clone https://github.com/Telestai-Project/app-telestai --recurse-submodules
```
2. Navigate into the cloned directory.
```bash
cd app-telestai
```
3. To begin developing, first connect your Ledger device to your PC and unlock it. Ensure it's displayed on the dashboard (not within another app). 
Then, execute the following command to download the necessary image and enter the container. The container will be located at the "/app" path.

   **Please note that all Ledger devices are compatible except for the Nano X, which is not currently supported due to technical limitations of Ledger.**

```bash
sudo docker run  --rm -ti --user root --privileged -v "$(pwd -P):/app" ghcr.io/telestai-project/ledger-app-builder-legacy:latest
```

4. You can choose which device to compile for by setting the BOLOS_SDK environment variable to the following values:

- Nano S
```bash
BOLOS_SDK=$NANOS_SDK
```
- NANO S+
```bash
BOLOS_SDK=$NANOSP_SDK
```
- NANO Flax
```bash
BOLOS_SDK=$FLAX_SDK
```
- NANO Stax
```bash
BOLOS_SDK=$STAX_SDK
```

5. To compile the app, run the following command within the container:

```bash
make
```
   **If everything was successful and no errors appeared on your computer screen.**

6. Run these commands on your host from the app's source folder once you have built the app for the device you want:

```shell
# Install Python virtualenv
python3 -m pip install virtualenv 
# Create the 'ledger' virtualenv
python3 -m virtualenv ledger
```

Enter the Python virtual environment

`source ledger/bin/activate`

```shell
# Install Ledgerblue (tool to load the app)
python3 -m pip install ledgerblue 
# Load the app.
python3 -m ledgerblue.runScript --scp --fileName bin/app.apdu --elfFile bin/app.elf
```

7. The user should review their device screen and confirm when prompted.

   **A new app called "Telestai" will appear in the main menu of your device.**

## This application adheres with Ledger latest application guidelines

## Are you testing a Ledger device application?
- [Go on Discord](https://discord.com/invite/VmFXfHnZE5) to chat with developer support and the developer community.
