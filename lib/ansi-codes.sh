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
RESET='\033[0m'

# Text decorations:
BOLD='\033[1m'
DIM='\033[2m'
ITALIC='\033[3m'
UNDERLINE='\033[4m'
BLINKING='\033[5m'
REVERSED='\033[7m'
INVISIBLE='\033[8m'
STRIKETHROUGH='\033[9m'

# Regular colour palette:
BLACK='\033[30m'
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
PURPLE='\033[35m'
CYAN='\033[36m'
WHITE='\033[37m'

# Background colors:
ON_BLACK='\033[40m'
ON_RED='\033[41m'
ON_GREEN='\033[42m'
ON_YELLOW='\033[43m'
ON_BLUE='\033[44m'
ON_PURPLE='\033[45m'
ON_CYAN='\033[46m'
ON_WHITE='\033[47m'

# Bright colours (basically shortcuts for `${COLOR}${BOLD}`):
BRIGHT_BLACK='\033[90m'
BRIGHT_RED='\033[91m'
BRIGHT_GREEN='\033[92m'
BRIGHT_YELLOW='\033[93m'
BRIGHT_BLUE='\033[94m'
BRIGHT_PURPLE='\033[95m'
BRIGHT_CYAN='\033[96m'
BRIGHT_WHITE='\033[97m'

ON_BRIGHT_BLACK='\033[100m'
ON_BRIGHT_RED='\033[101m'
ON_BRIGHT_GREEN='\033[102m'
ON_BRIGHT_YELLOW='\033[103m'
ON_BRIGHT_BLUE='\033[104m'
ON_BRIGHT_PURPLE='\033[105m'
ON_BRIGHT_CYAN='\033[106m'
ON_BRIGHT_WHITE='\033[107m'

# TESTS

#echo 'DECORATIONS: ============================================================'

#echo -e "${BOLD}BOLD${RESET} - RESET"
#echo -e "${DIM}DIM${RESET} - RESET"
#echo -e "${ITALIC}ITALIC${RESET} - RESET"
#echo -e "${UNDERLINE}UNDERLINE${RESET} - RESET"
#echo -e "${BLINKING}BLINKING${RESET} - RESET"
#echo -e "${REVERSED}REVERSED${RESET} - RESET"
#echo -e "${INVISIBLE}INVISIBLE${RESET} - RESET"
#echo -e "${STRIKETHROUGH}STRIKETHROUGH${RESET} - RESET"

#echo 'FOREGROUND: ============================================================='

#echo -e "${BLACK}BLACK${RESET} - RESET"
#echo -e "${RED}RED${RESET} - RESET"
#echo -e "${GREEN}GREEN${RESET} - RESET"
#echo -e "${YELLOW}YELLOW${RESET} - RESET"
#echo -e "${BLUE}BLUE${RESET} - RESET"
#echo -e "${PURPLE}PURPLE${RESET} - RESET"
#echo -e "${CYAN}CYAN${RESET} - RESET"
#echo -e "${WHITE}WHITE${RESET} - RESET"

#echo 'FOREGROUND DIM:=========================================================='

#echo -e "${BLACK}${DIM}BLACK DIM${RESET} - RESET"
#echo -e "${RED}${DIM}RED DIM${RESET} - RESET"
#echo -e "${GREEN}${DIM}GREEN DIM${RESET} - RESET"
#echo -e "${YELLOW}${DIM}YELLOW DIM${RESET} - RESET"
#echo -e "${BLUE}${DIM}BLUE DIM${RESET} - RESET"
#echo -e "${PURPLE}${DIM}PURPLE DIM${RESET} - RESET"
#echo -e "${CYAN}${DIM}CYAN DIM${RESET} - RESET"
#echo -e "${WHITE}${DIM}WHITE DIM${RESET} - RESET"

#echo 'FOREGROUND BOLD: ========================================================'

#echo -e "${BLACK}${BOLD}BLACK BOLD${RESET} - RESET"
#echo -e "${RED}${BOLD}RED BOLD${RESET} - RESET"
#echo -e "${GREEN}${BOLD}GREEN BOLD${RESET} - RESET"
#echo -e "${YELLOW}${BOLD}YELLOW BOLD${RESET} - RESET"
#echo -e "${BLUE}${BOLD}BLUE BOLD${RESET} - RESET"
#echo -e "${PURPLE}${BOLD}PURPLE BOLD${RESET} - RESET"
#echo -e "${CYAN}${BOLD}CYAN BOLD${RESET} - RESET"
#echo -e "${WHITE}${BOLD}WHITE BOLD${RESET} - RESET"

#echo 'FOREGROUND BRIGHT: ======================================================'

#echo -e "${BRIGHT_BLACK}BRIGHT_BLACK${RESET} - RESET"
#echo -e "${BRIGHT_RED}BRIGHT_RED${RESET} - RESET"
#echo -e "${BRIGHT_GREEN}BRIGHT_GREEN${RESET} - RESET"
#echo -e "${BRIGHT_YELLOW}BRIGHT_YELLOW${RESET} - RESET"
#echo -e "${BRIGHT_BLUE}BRIGHT_BLUE${RESET} - RESET"
#echo -e "${BRIGHT_PURPLE}BRIGHT_PURPLE${RESET} - RESET"
#echo -e "${BRIGHT_CYAN}BRIGHT_CYAN${RESET} - RESET"
#echo -e "${BRIGHT_WHITE}BRIGHT_WHITE${RESET} - RESET"

#echo 'BACKGROUND: ============================================================='

#echo -e "${ON_BLACK}ON_BLACK${RESET} - RESET"
#echo -e "${ON_RED}ON_RED${RESET} - RESET"
#echo -e "${ON_GREEN}ON_GREEN${RESET} - RESET"
#echo -e "${ON_YELLOW}ON_YELLOW${RESET} - RESET"
#echo -e "${ON_BLUE}ON_BLUE${RESET} - RESET"
#echo -e "${ON_PURPLE}ON_PURPLE${RESET} - RESET"
#echo -e "${ON_CYAN}ON_CYAN${RESET} - RESET"
#echo -e "${ON_WHITE}ON_WHITE${RESET} - RESET"

#echo 'BACKGROUND BRIGHT: ======================================================'

#echo -e "${ON_BRIGHT_BLACK}ON_BRIGHT_BLACK${RESET} - RESET"
#echo -e "${ON_BRIGHT_RED}ON_BRIGHT_RED${RESET} - RESET"
#echo -e "${ON_BRIGHT_GREEN}ON_BRIGHT_GREEN${RESET} - RESET"
#echo -e "${ON_BRIGHT_YELLOW}ON_BRIGHT_YELLOW${RESET} - RESET"
#echo -e "${ON_BRIGHT_BLUE}ON_BRIGHT_BLUE${RESET} - RESET"
#echo -e "${ON_BRIGHT_PURPLE}ON_BRIGHT_PURPLE${RESET} - RESET"
#echo -e "${ON_BRIGHT_CYAN}ON_BRIGHT_CYAN${RESET} - RESET"
#echo -e "${ON_BRIGHT_WHITE}ON_BRIGHT_WHITE${RESET} - RESET"
