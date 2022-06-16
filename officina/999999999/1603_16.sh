#!/bin/bash
#===============================================================================
#
#          FILE:  1603_16.sh
#
#         USAGE:  ./999999999/1603_16.sh
#                 time ./999999999/1603_16.sh
#
#   DESCRIPTION:  ---
#
#       OPTIONS:  ---
#
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  EticaAI
#       LICENSE:  Public Domain dedication
#                 SPDX-License-Identifier: Unlicense
#       VERSION:  v1.0
#       CREATED:  2022-06-15 17:25 UTC started.
#      REVISION:  ---
#===============================================================================
set -e



ROOTDIR="$(pwd)"

# shellcheck source=1603_16.lib.sh
. "$ROOTDIR"/999999999/1603_16.lib.sh

# ---------------------------------------------------------------------------- #
## Example of log as local user
#     cd /workspace/git/fititnt/MDCIII-boostrapper/officina
#     sudo su mdciii
#     source ~/.profile
# Test
#   hxltmcli --help
#   ./999999999/1603_16.sh
#
## Example with GitHub actions
#   @TODO
# ---------------------------------------------------------------------------- #

# 1603_16_24 Angola
# gh_repo_create_1603_16_N "1603_16_24"
# 1603_16_508 Mozambique
# gh_repo_create_1603_16_N "1603_16_508"

# gh_repo_fetch_lexicographi_sine_finibus

# echo "Login shell?"
# shopt login_shell

#### The Happy Path ____________________________________________________________

### 1. Install system dependencies (likely relevant only for GitHub Actions) ---
local_system_dependencies_python

### 2. Download main repository   ----------------------------------------------
## 2.1 The repository itself
# Download (if necessary) https://github.com/EticaAI/lexicographi-sine-finibus
# to local dir
gh_repo_fetch_lexicographi_sine_finibus

## 2.2 Fetch new external data, if relevant
gh_repo_fetch_lexicographi_sine_finibus_1603_16_init

