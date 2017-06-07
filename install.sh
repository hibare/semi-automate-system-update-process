#!/bin/sh
#Property of SKYNET Inc.
#Configures the system for use
clear
echo "Launching script ... [DONE]"
echo ''

#Declaring color variables
RED='\033[0;36m' 	#CYAN COLOUR
NC='\033[0m'	 	#NO COLOUR
GREEN='\033[0;32m' 	#GREEN COLOUR
CYAN='\033[0;31m'	#RED COLOUR
YELLOW='\033[1;33m'

echo  "${CYAN}=========================================================${NC}"
echo  "${YELLOW}UU    UU  PPPPPP   DDDDDD   AAAAAAA  TTTTTTTT  EEEEE${NC}"
echo  "${YELLOW}UU    UU  PP  PPP  DD  DDD  AAA AAA   TTTTTT   EE${NC}"
echo  "${YELLOW}UU    UU  PPPPPP   DD   DDD AA   AA     TT     EEEEE${NC}"
echo  "${YELLOW}UUUUUUUU  PP       DD  DDD  AAAAAAA     TT     EE${NC}"
echo  "${YELLOW} UUUUUU   PP       DDDDDD   AA   AA     TT     EEEEE${NC}"
echo  "${CYAN}=========================================================${NC}"
echo  "Property of SKNET Inc."

#Start commands from here

#Check if user is root
if [ `id -u` != 0 ] ; then
        echo "${YELLOW}ALERT ... got root?${NC}"
	exit 1
fi

echo ${YELLOW}
echo "Installing... "
cc update.c
mv a.out update
cp update /bin
echo "Please enter neccessary update commands one by one and press CTRL+D at the end..."
cd ~
cat > list.sn
echo "DONE"
echo ${NC}
