#!/bin/bash
# doitnow.sh
# Author: n0logic
# Date: 05/07/2017
# Updated: 05/24/2017
# Basic quick commands for Kali system and various engagement tools.

# Function mainmenu - Main Menu, first function called.
mainmenu(){
while :
do
    clear
    cat<<"EOF"

       _______  .__                .__
  ____ \   _  \ |  |   ____   ____ |__| ____
 /    \/  /_\  \|  |  /  _ \ / ___\|  |/ ___\
|   |  \  \_/   \  |_(  <_> ) /_/  >  \  \___
|___|  /\_____  /____/\____/\___  /|__|\___  >
     \/       \/           /_____/         \/

    ==============================
    Do It Now!
    General tools to fit my needs
    ------------------------------
    Please enter your choice:

    Pentesting Tools (1)
    System Services  (2)
    System Updates   (3)
    Software Install (4)
    Misc Options     (5)
    Reboot System    (6)
           (Q)uit
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  pentools ;;
    "2")  echo "Try Harder!" ;;
    "3")  echo "Not dis time looosahhh!" ;;
    "6")  sudo reboot;;
    "Q")  exit                      ;;
    "q")  exit                      ;;
     * )  echo "invalid option"     ;;
    esac
    sleep 1
done
}

# Option 1 - Penetration Testing Tools submenu
pentools(){
while :
do
    clear
    cat<<EOF
    ==============================
    Penetration Testing Tools
    ------------------------------
    Please enter your choice:

    enum Script      (1)
           (B)ack
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  enumscript ;;
    "B")  mainmenu ;;
    "b")  mainmenu ;;
    "Q")  exit                      ;;
    "q")  exit   ;;
     * )  echo "invalid option"     ;;
    esac
    sleep 1
done
}

# enum.sh built in woohoo
enumscript(){
# main script begin
echo -e "n0logic's Enumerate o'matic!\n"
echo -e "This script will read iplist from current directory and enumerate\n"
echo -e "each host or IP in the file.\n"
echo -e "Results will be saved to text documents in your home folder"
echo -e "------------------------------------------------------------------\n"
for output in $( cat ./iplist.txt )
 do
    echo -e "\nCreating results folder at $HOME/enumresults/$output/"
    mkdir $HOME/enumresults/$output/
    echo -e "\nRunning nmap -sV -sC $output "
    nmap -sV -sC "$output" > $HOME/enumresults/$output/nmap.txt
    cat $HOME/enumresults/$output/nmap.txt
done
}

# enum4linux script
e_e4l(){
echo -e "\nRunning enum4linux -a $output "
enum4linux -a $output>$HOME/enumresults/$output/enum4linux.txt
echo -e "\nFinished with enum4linux scan! cat $HOME/enumresults/$output/enum4linux.txt"
cat $HOME/enumresults/$output/enum4linux.txt
}

# Run the main menu
mainmenu
