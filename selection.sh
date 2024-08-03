#!/bin/bash

# Define SDKs (these should be environment variables already defined)
NANOS_SDK=${NANOS_SDK}
NANOSP_SDK=${NANOSP_SDK}
NANOX_SDK=${NANOX_SDK}
FLEX_SDK=${FLEX_SDK}
STAX_SDK=${STAX_SDK}

while true; do
    echo "Which Ledger device do you have?"
    echo "1) Ledger Nano S"
    echo "2) Ledger Nano S+"
    echo "3) Ledger Nano X"
    echo "4) Ledger Flex"
    echo "5) Ledger Stax"
    echo "6) Exit"
    read -r option

    case $option in
        1)
            BOLOS_SDK=$NANOS_SDK
            ;;
        2)
            BOLOS_SDK=$NANOSP_SDK
            ;;
        3)
            BOLOS_SDK=$NANOX_SDK
            ;;
        4)
            BOLOS_SDK=$FLEX_SDK
            ;;
        5)
            BOLOS_SDK=$STAX_SDK
            ;;
        6)
            exit 0
            ;;
        *)
            echo "Invalid option. Please select again."
            continue
            ;;
    esac

    while true; do
        echo "Is the device connected, unlocked, and not in any application? (Yes/No)"
        read -r response
        case $response in
            Yes|yes|YES|y|Y)
                make load
                exit 0
                ;;
            No|no|NO|n|N)
                break
                ;;
            *)
                echo "Invalid response. Please answer 'Yes' or 'No'."
                ;;
        esac
    done
done
