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
echo "+              Install update script                 +"
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

#Begin installation

#Check if user is root
if [ `id -u` != 0 ] ; then
        echo "${RED}ALERT ... got root?${NC}"
	exit 1
fi

#Check for dependencies
echo "${CYAN}Checking for dependencies ... ${NC}"

#Check for gcc
echo -n "[*] Checking for gcc ... "
which gcc > /dev/null 2>&1
if [ $? -eq 0 ]; then
	echo "${GREEN}[Present]${NC}"
else
	echo "${RED}[Absent]${NC}"
	echo "${CYAN}Please install it to proceed${NC}"
	echo "${CYAN}ABORT${NC}"
	exit
fi

#Begin installation
echo "${CYAN}Installing ... ${NC}"

#Compile source file
echo -n "[*] Compiling source ... "
cc src/update.c -o src/update 
if [ $? -eq 0 ]; then
	echo "${GREEN}[Done]${NC}"
else
	echo "${RED}[Failed]${NC}"
	echo "{RED}ABORT${NC}"
	exit
fi

#Create directory
echo -n "[*] Creating file structure ... "
mkdir -p ~/.crazyScripts/updateScript > /dev/null 2>&1
if [ $? -eq 0 ]; then
	echo "${GREEN}[Done]${NC}"
else
	echo "${RED}[Failed]${NC}"
	echo "${RED}ABORT${NC}"
	exit
fi

#Copy compiled file
echo -n "[*] Moving binary file ... "
mv src/update ~/.crazyScripts/updateScript > /dev/null 2>&1
if [ $? -eq 0 ]; then
	echo "${GREEN}[Done]${NC}"
else
	echo "${RED}[Failed]${NC}"
	echo "${RED}ABORT${NC}"
	exit
fi

#Create symbolic link
echo -n "[*] Creating links ... "
ln -s ~/.crazyScripts/updateScript/update /bin/update > /dev/null 2>&1
if [ $? -eq 0 ]; then
	echo "${GREEN}[Done]${NC}"
else
	echo "${RED}[Failed]${NC}"
	echo "${RED}ABORT${NC}"
	exit
fi

#Detect os
echo -n "[*] Detecting OS ... "
OS=`uname -n`
if [ "$OS" != "ubuntu" ]; then
	echo "[Other]"
	echo "Please enter neccessary update commands one by one and press CTRL+D at the end..."
	cat > ~/.crazyScripts/updateScript/list.sn

else
	echo "[Ubuntu]"

	#Configure commands
	echo -n "[*] Configuring commands ... "
	echo "apt-get autoclean" >> ~/.crazyScripts/updateScript/list.sn
	echo "apt-get update" >> ~/.crazyScripts/updateScript/list.sn
	echo "apt-get upgrade -y" >> ~/.crazyScripts/updateScript/list.sn
	echo "apt-get dist-upgrade -y" >> ~/.crazyScripts/updateScript/list.sn
	echo "apt-get autoremove" >> ~/.crazyScripts/updateScript/list.sn

	if [ $? -eq 0 ]; then
		echo "${GREEN}[Done]${NC}"
	else
		echo "${RED}[Failed]${NC}"
		echo "${RED}ABORT${NC}"
		exit
	fi
fi

echo "Completed"
echo "${CYAN}Run command update to update the system${NC}" 
