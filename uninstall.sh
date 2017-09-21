#!/bin/sh

#Declaring color variables
CYAN='\033[0;36m'       #CYAN COLOUR
NC='\033[0m'            #NO COLOUR
GREEN='\033[0;32m'      #GREEN COLOUR
RED='\033[0;31m'        #RED COLOUR
YELLOW='\033[1;33m'

#Clear screen
clear

#Banner
echo "======================================================"
echo "+             uninstall update script                +"
echo "======================================================"                                                  
echo "    [0;1;34;94m▄▄▄▄[0m   [0;34m▄▄▄▄▄▄[0m               [0;37m▄▄▄▄▄[0m   [0;1;30;90m▄▄▄[0m    [0;1;30;90m▄▄▄[0m"
echo "  [0;34m██▀▀▀▀█[0m  [0;34m██▀▀▀[0;37m▀██[0m   [0;37m▄████▄[0m   [0;37m█[0;1;30;90m▀▀▀▀██▄[0m  [0;1;30;90m██▄[0m  [0;1;30;90m▄█[0;1;34;94m█[0m" 
echo " [0;34m██▀[0m       [0;37m██[0m    [0;37m██[0m [0;37m▄██▀[0m  [0;1;30;90m▀██[0m        [0;1;30;90m██[0m   [0;1;34;94m██▄▄██[0m " 
echo " [0;37m██[0m        [0;37m█████[0;1;30;90m██[0m  [0;1;30;90m██[0m [0;1;30;90m▄█████[0m      [0;1;34;94m▄█▀[0m     [0;1;34;94m▀██▀[0m"   
echo " [0;37m██▄[0m       [0;1;30;90m██[0m  [0;1;30;90m▀██▄[0m [0;1;30;90m██[0m [0;1;30;90m█[0;1;34;94m█▄▄██[0m    [0;1;34;94m▄█▀[0m        [0;34m██[0m"    
echo "  [0;1;30;90m██▄▄▄▄█[0m  [0;1;30;90m██[0m    [0;1;34;94m██[0m [0;1;34;94m▀█▄[0m [0;1;34;94m▀▀▀▀▀[0m  [0;1;34;94m▄[0;34m██▄▄▄▄▄[0m     [0;34m██[0m"    
echo "    [0;1;30;90m▀▀▀▀[0m   [0;1;34;94m▀▀[0m    [0;1;34;94m▀▀▀[0m [0;1;34;94m▀██[0;34m▄▄▄█▄[0m  [0;34m▀▀▀▀▀▀▀▀[0m     [0;37m▀▀[0m"    
echo "                       [0;34m▀▀▀▀▀[0m"                      
                                                
echo "======================================================"
echo "  Developed by : Shubham Hibare (CR@2Y)"
echo "  Website      : http://hibare.in"  
echo "  Github       : https://hibare.github.io/"
echo "  Linkedin     : https://linkedin.com/in/hibare"
echo "  License      : Apache License 2.0"
echo "======================================================"
echo "${RED}Disclaimer:${NC} Author of this script is not responsible 
for any damage caused to your system from using this 
script. Use this script at your own risk. You have ${RED}15 
seconds${NC} to abort the process."
echo "======================================================"
sleep 15

#Begin uninstallation

#Check if user is root
if [ `id -u` != 0 ] ; then
        echo "${RED}ALERT ... got root?${NC}"
	exit 1
fi

#Remove binary file
echo -n "[*] Removing binary file ... "
rm /bin/update >> /dev/null

if [ $? -eq 0 ]; then
	echo "${GREEN}[Done]${NC}"
else
	echo "${RED}[Failed]${NC}"
	echo "${CYAN}ABORT${NC}"
	exit
fi

#remove updateScript directory
echo -n "[*] Removing updateScript directory ... "
rm -r ~/.crazyScripts/updateScript >> /dev/null
if [ $? -eq 0 ]; then
	echo "${GREEN}[Done]${NC}"
else
	echo "${RED}[Failed]${NC}"
	echo "{RED}ABORT${NC}"
	exit
fi

echo "Completed"
