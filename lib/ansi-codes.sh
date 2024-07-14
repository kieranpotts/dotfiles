#!/bin/sh

# ==============================================================================
# List of the most useful ANSI color codes.
#
# References:
# - https://stackoverflow.com/a/28938235
# - https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797
# - https://github.com/fidian/ansi
# ==============================================================================

# Reset all colors and decorations:
export RESET='\033[0m'

# Text decorations:
export BOLD='\033[1m'
export DIM='\033[2m'
export ITALIC='\033[3m'
export UNDERLINE='\033[4m'
export BLINKING='\033[5m'
export REVERSED='\033[7m'
export INVISIBLE='\033[8m'
export STRIKETHROUGH='\033[9m'

# Regular colour palette:
export BLACK='\033[30m'
export RED='\033[31m'
export GREEN='\033[32m'
export YELLOW='\033[33m'
export BLUE='\033[34m'
export PURPLE='\033[35m'
export CYAN='\033[36m'
export WHITE='\033[37m'

# Background colors:
export ON_BLACK='\033[40m'
export ON_RED='\033[41m'
export ON_GREEN='\033[42m'
export ON_YELLOW='\033[43m'
export ON_BLUE='\033[44m'
export ON_PURPLE='\033[45m'
export ON_CYAN='\033[46m'
export ON_WHITE='\033[47m'

# Bright colours (basically shortcuts for `${COLOR}${BOLD}`):
export BRIGHT_BLACK='\033[90m'
export BRIGHT_RED='\033[91m'
export BRIGHT_GREEN='\033[92m'
export BRIGHT_YELLOW='\033[93m'
export BRIGHT_BLUE='\033[94m'
export BRIGHT_PURPLE='\033[95m'
export BRIGHT_CYAN='\033[96m'
export BRIGHT_WHITE='\033[97m'

export ON_BRIGHT_BLACK='\033[100m'
export ON_BRIGHT_RED='\033[101m'
export ON_BRIGHT_GREEN='\033[102m'
export ON_BRIGHT_YELLOW='\033[103m'
export ON_BRIGHT_BLUE='\033[104m'
export ON_BRIGHT_PURPLE='\033[105m'
export ON_BRIGHT_CYAN='\033[106m'
export ON_BRIGHT_WHITE='\033[107m'

# TESTS

#echo 'DECORATIONS: ============================================================'

#printf "%bBOLD%b - RESET\n" "${BOLD}" "${RESET}"
#printf "%bDIM%b - RESET\n" "${DIM}" "${RESET}"
#printf "%bITALIC%b - RESET\n" "${ITALIC}" "${RESET}"
#printf "%bUNDERLINE%b - RESET\n" "${UNDERLINE}" "${RESET}"
#printf "%bBLINKING%b - RESET\n" "${BLINKING}" "${RESET}"
#printf "%bREVERSED%b - RESET\n" "${REVERSED}" "${RESET}"
#printf "%bINVISIBLE%b - RESET\n" "${INVISIBLE}" "${RESET}"
#printf "%bSTRIKETHROUGH%b - RESET\n" "${STRIKETHROUGH}" "${RESET}"

#echo 'FOREGROUND: ============================================================='

#printf "%bBLACK%b - RESET\n" "${BLACK}" "${RESET}"
#printf "%bRED%b - RESET\n" "${RED}" "${RESET}"
#printf "%bGREEN%b - RESET\n" "${GREEN}" "${RESET}"
#printf "%bYELLOW%b - RESET\n" "${YELLOW}" "${RESET}"
#printf "%bBLUE%b - RESET\n" "${BLUE}" "${RESET}"
#printf "%bPURPLE%b - RESET\n" "${PURPLE}" "${RESET}"
#printf "%bCYAN%b - RESET\n" "${CYAN}" "${RESET}"
#printf "%bWHITE%b - RESET\n" "${WHITE}" "${RESET}"

#echo 'FOREGROUND DIM:=========================================================='

#printf "%bBLACK DIM%b - RESET\n" "${BLACK}${DIM}" "${RESET}"
#printf "%bRED DIM%b - RESET\n" "${RED}${DIM}" "${RESET}"
#printf "%bGREEN DIM%b - RESET\n" "${GREEN}${DIM}" "${RESET}"
#printf "%bYELLOW DIM%b - RESET\n" "${YELLOW}${DIM}" "${RESET}"
#printf "%bBLUE DIM%b - RESET\n" "${BLUE}${DIM}" "${RESET}"
#printf "%bPURPLE DIM%b - RESET\n" "${PURPLE}${DIM}" "${RESET}"
#printf "%bCYAN DIM%b - RESET\n" "${CYAN}${DIM}" "${RESET}"
#printf "%bWHITE DIM%b - RESET\n" "${WHITE}${DIM}" "${RESET}"

#echo 'FOREGROUND BOLD: ========================================================'

#printf "%bBLACK BOLD%b - RESET\n" "${BLACK}${BOLD}" "${RESET}"
#printf "%bRED BOLD%b - RESET\n" "${RED}${BOLD}" "${RESET}"
#printf "%bGREEN BOLD%b - RESET\n" "${GREEN}${BOLD}" "${RESET}"
#printf "%bYELLOW BOLD%b - RESET\n" "${YELLOW}${BOLD}" "${RESET}"
#printf "%bBLUE BOLD%b - RESET\n" "${BLUE}${BOLD}" "${RESET}"
#printf "%bPURPLE BOLD%b - RESET\n" "${PURPLE}${BOLD}" "${RESET}"
#printf "%bCYAN BOLD%b - RESET\n" "${CYAN}${BOLD}" "${RESET}"
#printf "%bWHITE BOLD%b - RESET\n" "${WHITE}${BOLD}" "${RESET}"

#echo 'FOREGROUND BRIGHT: ======================================================'

#printf "%bBRIGHT_BLACK%b - RESET\n" "${BRIGHT_BLACK}" "${RESET}"
#printf "%bBRIGHT_RED%b - RESET\n" "${BRIGHT_RED}" "${RESET}"
#printf "%bBRIGHT_GREEN%b - RESET\n" "${BRIGHT_GREEN}" "${RESET}"
#printf "%bBRIGHT_YELLOW%b - RESET\n" "${BRIGHT_YELLOW}" "${RESET}"
#printf "%bBRIGHT_BLUE%b - RESET\n" "${BRIGHT_BLUE}" "${RESET}"
#printf "%bBRIGHT_PURPLE%b - RESET\n" "${BRIGHT_PURPLE}" "${RESET}"
#printf "%bBRIGHT_CYAN%b - RESET\n" "${BRIGHT_CYAN}" "${RESET}"
#printf "%bBRIGHT_WHITE%b - RESET\n" "${BRIGHT_WHITE}" "${RESET}"

#echo 'BACKGROUND: ============================================================='

#printf "%bON_BLACK%b - RESET\n" "${ON_BLACK}" "${RESET}"
#printf "%bON_RED%b - RESET\n" "${ON_RED}" "${RESET}"
#printf "%bON_GREEN%b - RESET\n" "${ON_GREEN}" "${RESET}"
#printf "%bON_YELLOW%b - RESET\n" "${ON_YELLOW}" "${RESET}"
#printf "%bON_BLUE%b - RESET\n" "${ON_BLUE}" "${RESET}"
#printf "%bON_PURPLE%b - RESET\n" "${ON_PURPLE}" "${RESET}"
#printf "%bON_CYAN%b - RESET\n" "${ON_CYAN}" "${RESET}"
#printf "%bON_WHITE%b - RESET\n" "${ON_WHITE}" "${RESET}"

#echo 'BACKGROUND BRIGHT: ======================================================'

#printf "%bON_BRIGHT_BLACK%b - RESET\n" "${ON_BRIGHT_BLACK}" "${RESET}"
#printf "%bON_BRIGHT_RED%b - RESET\n" "${ON_BRIGHT_RED}" "${RESET}"
#printf "%bON_BRIGHT_GREEN%b - RESET\n" "${ON_BRIGHT_GREEN}" "${RESET}"
#printf "%bON_BRIGHT_YELLOW%b - RESET\n" "${ON_BRIGHT_YELLOW}" "${RESET}"
#printf "%bON_BRIGHT_BLUE%b - RESET\n" "${ON_BRIGHT_BLUE}" "${RESET}"
#printf "%bON_BRIGHT_PURPLE%b - RESET\n" "${ON_BRIGHT_PURPLE}" "${RESET}"
#printf "%bON_BRIGHT_CYAN%b - RESET\n" "${ON_BRIGHT_CYAN}" "${RESET}"
#printf "%bON_BRIGHT_WHITE%b - RESET\n" "${ON_BRIGHT_WHITE}" "${RESET}"
