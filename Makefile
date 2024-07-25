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

VARIANT_VALUES = aipg

# Application source files
# There is no additional sources for bitcoin
#APP_SOURCE_PATH += src/

# simplify for tests
ifndef COIN
COIN=aipg
endif

# Enabling DEBUG flag will enable PRINTF and disable optimizations
#DEBUG = 1

ifeq ($(COIN),aipg)
# AI Power Grid
BIP44_COIN_TYPE=2886  
BIP44_COIN_TYPE_2=2886 
COIN_P2PKH_VERSION=23
COIN_P2SH_VERSION=23 
COIN_FAMILY=1 
COIN_COINID=\"AI Power Grid\" 
COIN_COINID_NAME="AI Power Grid"
COIN_COINID_SHORT=\"AIPG\" 
COIN_KIND=COIN_KIND_AIPG
APPNAME ="AI Power Grid"	

else ifeq ($(filter clean,$(MAKECMDGOALS)),)
$(error Unsupported COIN - use $(VARIANT_VALUES))
endif

include lib-app-bitcoin/Makefile
