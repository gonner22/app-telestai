# Ledger AI Power Grid Application

This application automates the process of creating a Ledger device app for our AI Power Grid cryptocurrency. It utilizes a Docker container to simplify this process, allowing users to:

- Select their specific Ledger device from a comprehensive list.
- Install the AI Power Grid app directly onto their chosen device.

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

> **Warning**
> - To ensure data protection, users must back up their Ledger device recovery seeds before using this application. AIPG is not responsible for any failures or issues that may arise. While the app has been tested on some devices, we rely on community feedback to validate its functionality on others, including the Ledger Flex and Stax.
> - This repository contains a submodule, and should therefore be cloned with the appropriate command: 

1. Clone the repository app-bitcoin-clone-boilerplate.
```bash 
git clone https://github.com/gonner22/app-bitcoin-clone-boilerplate --recurse-submodules
```
2. Navigate into the cloned directory.
```bash
cd app-bitcoin-clone-boilerplate
```
3. To install the app, first connect your device to your computer. Then, run the following command to download the image and transfer it to your Ledger device.

**Please note that all Ledger devices are compatible except for the Nano X, which is not currently supported due to technical limitations of Ledger.**

```bash
docker run --rm -ti  -v "$(realpath .):/app" --privileged -v "/dev/bus/usb:/dev/bus/usb" --user root ghcr.io/gonner22/ledger-app-builder-legacy:latest
```
4. The user will see a menu to select their device and confirm it is connected, unlocked, and not currently running any applications..

5. The user should review their device screen and confirm when prompted.

If everything was successful and no errors appeared on your computer screen, a new app called "AI Power Grid" will appear in the main menu of your device.

## Windows Installation Instructions
**(with PowerShell)**

#### Pre-requisites
- Install and configure
  - :information_source: Docker: https://docs.docker.com/engine/install.
  - :information_source: It is assumed you have [Python](https://www.python.org/downloads/) installed on your computer.

> **Warning**
> - To ensure data protection, users must back up their Ledger device recovery seeds before using this application. AIPG is not responsible for any failures or issues that may arise. While the app has been tested on some devices, we rely on community feedback to validate its functionality on others, including the Ledger Flex and Stax.
> - This repository contains a submodule, and should therefore be cloned with the appropriate command: 

1. Clone the repository app-bitcoin-clone-boilerplate.
```bash 
git clone https://github.com/gonner22/app-bitcoin-clone-boilerplate --recurse-submodules
```
2. Navigate into the cloned directory.
```bash
cd app-bitcoin-clone-boilerplate
```
3. To install the app, first connect your device to your computer. Then, run the following command to download the image and compile the app for your Ledger device. Users will choose their device from a menu and confirm it's connected, unlocked, has no running apps, and the correct OS is selected.

**Please note that all Ledger devices are compatible except for the Nano X, which is not currently supported due to technical limitations of Ledger.**

```bash
docker run --rm -ti --privileged -v "$(Get-Location):/app" ghcr.io/gonner22/ledger-app-builder-legacy:latest
```

**If everything was successful and no errors appeared on your computer screen.**

4. Run these commands on your host from the app's source folder once you have built the app for the device you want:

```shell
# Install Python virtualenv
python3 -m pip install virtualenv 
# Create the 'ledger' virtualenv
python3 -m virtualenv ledger
```

Enter the Python virtual environment

`.\ledger\Scripts\Activate.ps1`

```shell
# Install Ledgerblue (tool to load the app)
python3 -m pip install ledgerblue 
# Load the app.
python3 -m ledgerblue.runScript --scp --fileName bin/app.apdu --elfFile bin/app.elf
```

5. The user should review their device screen and confirm when prompted.

A new app called "AI Power Grid" will appear in the main menu of your device.

## macOS Installation Instructions

#### Pre-requisites
- Install and configure
  - :information_source: Docker: https://docs.docker.com/engine/install.
  - :information_source: It is assumed you have [Python](https://www.python.org/downloads/) installed on your computer.

> **Warning**
> - To ensure data protection, users must back up their Ledger device recovery seeds before using this application. AIPG is not responsible for any failures or issues that may arise. While the app has been tested on some devices, we rely on community feedback to validate its functionality on others, including the Ledger Flex and Stax.
> - This repository contains a submodule, and should therefore be cloned with the appropriate command: 

1. Clone the repository app-bitcoin-clone-boilerplate.
```bash 
git clone https://github.com/gonner22/app-bitcoin-clone-boilerplate --recurse-submodules
```
2. Navigate into the cloned directory.
```bash
cd app-bitcoin-clone-boilerplate
```
3. To install the app, first connect your device to your computer. Then, run the following command to download the image and compile the app for your Ledger device. Users will choose their device from a menu and confirm it's connected, unlocked, has no running apps, and the correct OS is selected.

**Please note that all Ledger devices are compatible except for the Nano X, which is not currently supported due to technical limitations of Ledger.**

```bash
sudo docker run  --rm -ti --user root --privileged -v "$(pwd -P):/app" ghcr.io/gonner22/ledger-app-builder-legacy:latest
```

**If everything was successful and no errors appeared on your computer screen.**

4. Run these commands on your host from the app's source folder once you have built the app for the device you want:

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

5. The user should review their device screen and confirm when prompted.

A new app called "AI Power Grid" will appear in the main menu of your device.

## This application adheres with Ledger latest application guidelines

## Are you testing a Ledger device application?
- [Go on Discord](https://discord.gg/W9D8j6HCtC) to chat with developer support and the developer community.

