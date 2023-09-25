## LxaNce Hacker
__version__=1.1
clear

## Directories
BASE_DIR=$(realpath "$(dirname "$BASH_SOURCE")")

## ANSI colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
LIGHT_GRAY="$(printf '\033[37m')"
DARK_GRAY="$(printf '\033[90m')"
LIGHT_RED="$(printf '\033[91m')"
LIGHT_GREEN="$(printf '\033[92m')"
LIGHT_YELLOW="$(printf '\033[93m')"
LIGHT_BLUE="$(printf '\033[94m')"
LIGHT_MAGENTA="$(printf '\033[95m')"
LIGHT_CYAN="$(printf '\033[96m')"

## Reset terminal colors
reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
	return
}

## Check Internet Status
check_status() {
	echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Internet Status ${BLUE}: "
	timeout 3s curl -fIs "https://google.com" > /dev/null
	[ $? -eq 0 ] && echo -e "${GREEN}Online${WHITE}" || echo -e "${RED}Offline${WHITE}"
}

## Banner
banner() {
	cat <<- EOF
		${RED}
        ${RED}             ,----------------,              ,---------,
        ${RED}        ,-----------------------,          ,"        ,"|
        ${RED}      ,"                      ,"|        ,"  ${BLUE}V${__version__}${RED}  ,"  |
        ${RED}     +-----------------------+  |      ,"        ,"  U |
        ${RED}     |  .-----------------.  |  |     +---------+  P   |
        ${RED}     |  |                 |  |  |     | ${WHITE}-==----'${RED}|C     |
        ${RED}     |  |  ${GREEN}AnonMailer!${RED}    |  |  |     |         |      |
        ${RED}     |  |  ${GREEN}Bad command or${RED} |  |  |/----|${WHITE}'---=${RED}    |      |
        ${RED}     |  |  ${CYAN}C:\>LxaNce_${RED}    |  |  |   ,/|${WHITE}==== ooo${RED} |      ;
        ${RED}     |  |                 |  |  |  // |${WHITE}(((( [33]${RED}|    ,"
        ${RED}     |  '-----------------'  |," .;'| |${WHITE}((((${RED}     |  ,"
        ${RED}     +-----------------------+  ;;  | |         |,"
        ${RED}        /_)______________(_/  //'   | +---------+
           ___________________________/___  ',
          /  ${WHITE}oooooooooooooooo  .o.  oooo${RED} /,   \,"-----------
         / ${WHITE}==ooooooooooooooo==.o.  ooo=${RED} //   ,'\--{)B     ,"
        /${WHITE}_==__==========__==_ooo__ooo=${RED}_/'   /___________,"
        '----------------------------'

		${GREEN}[${WHITE}-${GREEN}]${CYAN} Tool Created by LxaNce-Hacker (Prince Katiyar)${WHITE}
	EOF
	check_status
}

banner

output() {
    clear
	cat <<- EOF
		${RED}
        ${RED}             ,----------------,              ,---------,
        ${RED}        ,-----------------------,          ,"        ,"|
        ${RED}      ,"                      ,"|        ,"  ${BLUE}V${__version__}${RED}  ,"  |
        ${RED}     +-----------------------+  |      ,"        ,"  U |
        ${RED}     |  .-----------------.  |  |     +---------+  P   |
        ${RED}     |  |                 |  |  |     | ${WHITE}-==----'${RED}|C     |
        ${RED}     |  | ${CYAN}C:\>LxaNce_${RED}     |  |  |     |         |      |
        ${RED}     |  | ${CYAN}C:\>${RED}            |  |  |/----|${WHITE}'---=${RED}    |      |
        ${RED}     |  | ${CYAN}C:\>${MAGENTA}$1${RED}  |  |  |   ,/|${WHITE}==== ooo${RED} |      ;
        ${RED}     |  |                 |  |  |  // |${WHITE}(((( [33]${RED}|    ,"
        ${RED}     |  '-----------------'  |," .;'| |${WHITE}((((${RED}     |  ,"
        ${RED}     +-----------------------+  ;;  | |         |,"
        ${RED}        /_)______________(_/  //'   | +---------+
           ___________________________/___  ',
          /  ${WHITE}oooooooooooooooo  .o.  oooo${RED} /,   \,"-----------
         / ${WHITE}==ooooooooooooooo==.o.  ooo=${RED} //   ,'\--{)B     ,"
        /${WHITE}_==__==========__==_ooo__ooo=${RED}_/'   /___________,"
        '----------------------------'
	EOF
}

echo -e
read -p "${RED}[${LIGHT_YELLOW}*${RED}]${GREEN} Receiver mail   ${BLUE}: ${RED}" To
read -p "${RED}[${LIGHT_YELLOW}*${RED}]${GREEN} Sender mail     ${BLUE}: ${RED}" From
read -p "${RED}[${LIGHT_YELLOW}*${RED}]${GREEN} Sender Name     ${BLUE}: ${RED}" Name
read -p "${RED}[${LIGHT_YELLOW}*${RED}]${GREEN} Subject         ${BLUE}: ${RED}" Subject
read -p "${RED}[${LIGHT_YELLOW}*${RED}]${GREEN} Message         ${BLUE}: ${RED}" Message

response=$(curl -s -X POST "https://lxancemail.000webhostapp.com/gmailer.php?to=$To&from=$From&name=$Name&subject=$Subject&message=$Message")

echo -e

if [[ $response == *"Email sent successfully"* ]]; then
    outcome="Email_sent"
else
    outcome="Email_Fail"
fi

output "$outcome"
