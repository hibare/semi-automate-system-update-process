//Update main file to update a debian based linux system
//Date: 02.08.2016


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>

/*Function name: main function
Return type: int, indicates the success or failure staus of the program.
Input type: void in general.
Description: main function to handle all the procedures required to update a system by executing the list of commands provided in the list.sn file
*/

int main() {
	FILE *fp;
	char line[1000],*home,path[80];
	int uid;

	//Check for root
	if((uid=getuid()) != 0) {
		printf("Alert... got root?\n");
		exit(EXIT_FAILURE);
	}
	printf("=========================================================\n"
		"UU    UU  PPPPPP   DDDDDD   AAAAAAA  TTTTTTTT  EEEEE\n"
		"UU    UU  PP  PPP  DD  DDD  AAA AAA   TTTTTT   EE\n"
		"UU    UU  PPPPPP   DD   DDD AA   AA     TT     EEEEE\n"
		"UUUUUUUU  PP       DD  DDD  AAAAAAA     TT     EE\n"
		" UUUUUU   PP       DDDDDD   AA   AA     TT     EEEEE\n"
		"=========================================================\n"	
		"		Property of SKYNET Inc.\n"
		"Automatically check for updates, downloads and installs update if any.\n"
		"clean the update cache and remove unwanted dependencies\n"
		"=========================================================\n");
	//Get value of environment variable HOME
	home=getenv("HOME");
	strcpy(path,home);
	strcat(path,"/list.sn");
	if(!(fp=fopen(path,"r"))) {
		perror("list.sn ");
		exit(EXIT_FAILURE);
	}

	//FEtch each line from the file and execute them
	while(fgets(line,sizeof line,fp) != NULL) {
		printf("running command %s ...\n",line);
		system(line);
		printf("#####################################################\n");
	}
	fclose(fp);
	return 0;
}
