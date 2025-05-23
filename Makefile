# ****************************************************************************
#    Ledger App Bitcoin
#    (c) 2023 Ledger SAS.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
# ****************************************************************************

########################################
#        Mandatory configuration       #
########################################

# Application version
# To use Trusted Input for segwit, app version must be kept > 2.0.0
APPVERSION_M = 2
APPVERSION_N = 0
APPVERSION_P = 3

APPDEVELOPPER="Ledger"
APPCOPYRIGHT="(c) 2024 Ledger"

APPNAME ="Telestai"

VARIANT_VALUES = tls

# Application source files
# There is no additional sources for bitcoin
#APP_SOURCE_PATH += src/

# simplify for tests
ifndef COIN
COIN=tls
endif

# Enabling DEBUG flag will enable PRINTF and disable optimizations
#DEBUG = 1

ifeq ($(COIN),tls)
	
# Refer to : https://github.com/dan-da/coinparams/blob/master/coinprefixes.md
BIP44_COIN_TYPE=10117
BIP44_COIN_TYPE_2=10117
COIN_P2PKH_VERSION=66
COIN_P2SH_VERSION=127

# Name of the coin that will be used in the app display
COIN_COINID_NAME="Telestai"

# Ticker that will be used in the transaction display
COIN_COINID_SHORT=\"TLS\" 

# Sign message magic header
COIN_COINID=\"TLS\"

# COIN_FAMILY can be set to FAMILY_BITCOIN, FAMILY_PEERCOIN, or FAMILY_STEALTH to handle 
# parsing of the timestamp in the transaction (see lib-app-bitcoin/transaction.c)
COIN_FAMILY=FAMILY_BITCOIN

# COIN_FLAGS can be set to FLAG_PEERCOIN_UNITS, FLAG_PEERCOIN_SUPPORT, or
# FLAG_SEGWIT_CHANGE_SUPPORT, (see lib-app-bitcoin/transaction.c and
# lib-app-bitcoin/hash_input_finalize_full.c)
COIN_FLAGS=

# COIN_FORKID can be set if needed
COIN_FORKID=0

else ifeq ($(filter clean,$(MAKECMDGOALS)),)
$(error Unsupported COIN - use $(VARIANT_VALUES))
endif

include lib-app-bitcoin/Makefile
