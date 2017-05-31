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

                /$$$$$$  /$$                     /$$
               /$$$_  $$| $$                    |__/
     /$$$$$$$ | $$$$\ $$| $$  /$$$$$$   /$$$$$$  /$$  /$$$$$$$
    | $$__  $$| $$ $$ $$| $$ /$$__  $$ /$$__  $$| $$ /$$_____/
    | $$  \ $$| $$\ $$$$| $$| $$  \ $$| $$  \ $$| $$| $$
    | $$  | $$| $$ \ $$$| $$| $$  | $$| $$  | $$| $$| $$
    | $$  | $$|  $$$$$$/| $$|  $$$$$$/|  $$$$$$$| $$|  $$$$$$$
    |__/  |__/ \______/ |__/ \______/  \____  $$|__/ \_______/
                                       /$$  \ $$
                                      |  $$$$$$/
                                       \______/
     /$$                                                               /$$
    | $$                                                              | $$
    | $$$$$$$   /$$$$$$   /$$$$$$$  /$$$$$$   /$$$$$$   /$$$$$$   /$$$$$$$
    | $$__  $$ /$$__  $$ /$$_____/ /$$__  $$ /$$__  $$ /$$__  $$ /$$__  $$
    | $$  \ $$| $$$$$$$$|  $$$$$$ | $$  \ $$| $$  \ $$| $$  \ $$| $$  | $$
    | $$  | $$| $$_____/ \____  $$| $$  | $$| $$  | $$| $$  | $$| $$  | $$
    | $$$$$$$/|  $$$$$$$ /$$$$$$$/|  $$$$$$$|  $$$$$$/|  $$$$$$/|  $$$$$$$
    |_______/  \_______/|_______/  \____  $$ \______/  \______/  \_______/
                                   /$$  \ $$
                                  |  $$$$$$/
                                   \______/

    ==============================
    Do It Now!
    General tools to fit my needs
    ------------------------------
    Please enter your choice:

    Pentesting Tools (1)
    System Services  (2)
    Updates / Setup  (3)
    something else   (4)
    Misc Options     (5)
    Reboot System    (6)
           (Q)uit
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  pentools ;;
    "2")  echo "Try Harder!" ;;
    "3")  setitup ;;
    "4")  setitup ;;
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
    dirb             (2)
    nikto            (3)
    Wireless Tools   (4)
    Discover Tools   (5)
    Hydra            (6)
           (B)ack
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  enumscript ;;
    "2")  e_dirb ;;
    "3")  e_nikto ;;
    "4")  e_wireless ;;
    "5")  e_discover;;
    "6")  e_hydra;;
    "B")  mainmenu ;;
    "b")  mainmenu ;;
    "Q")  exit                      ;;
    "q")  exit   ;;
     * )  echo "invalid option"     ;;
    esac
    sleep 1
done
}

# Option 4 - Updates / Install
setitup(){
while :
do
    clear
    cat<<EOF
    ==============================
    Software updates and setup
    ------------------------------
    Please enter your choice:

    Lee Baird Update Script      (1)
           (B)ack
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  setitupnow ;;
    "B")  mainmenu ;;
    "b")  mainmenu ;;
    "Q")  exit                      ;;
    "q")  exit   ;;
     * )  echo "invalid option"     ;;
    esac
    sleep 1
done
}

# setitupnow Function - Clone Lee Baird discover script and run update portion
setitupnow(){
  if [ -d /opt/discover/.git ]; then
       echo -e "\nUpdating Lee Baird Discover Script."
       cd /opt/discover/ ; git pull
       echo
  else
       echo -e "\nInstalling Lee Baird Discover Script to /opt/discover/"
       git clone https://github.com/leebaird/discover.git /opt/discover
       read -p "Press <enter> to continue."
       echo
 
 fi

  if [ -d /opt/SecLists/.git ]; then
	echo -e "Updating Seclist."
	cd /opt/SecLists/ ; git pull
  else
	echo -e "\nInstalling Daniel Miessler SecList."
	git clone https://github.com/danielmiessler/SecLists.git /opt/SecLists
	read -p "Press <enter> to continue."
	echo
  fi

  bash /opt/discover/update.sh
  if [ -d /opt/kali-scripts/.git ]; then
      echo -e"Updating doitnow script."
      cd /opt/kali-scripts/ ; git pull
      echo
      read
  else
      echo -e "\nEnter the directory doitnow is located in."
      read -er path
      cd $path ; git pull
      read
  fi
  mainmenu
}

# enum.sh built in woohoo
enumscript(){
i = 1
echo -e "n0logic's Enumerate o'matic!\n"
echo -e "This script will read iplist from current directory and enumerate\n"
echo -e "each host or IP in the file.\n"
echo -e "Results will be saved to text documents in your home folder"
echo -e "------------------------------------------------------------------\n"
for output in $( cat ./iplist.txt )
 do
    echo -e "\nCreating results folder at $HOME/enumresults/$output/"
    mkdir $HOME/enumresults/$output/
    echo -e "\nRunning nmap -sV -sC $output in new tab"
    foo="nmap -sS -sU -T4 -A -v -PE -PP -PS80,443 -PA3389 -PU40125 -PY -g 53 --script 'default or (discovery)' $output > $HOME/enumresults/$output/nmap.txt"
    gnome-terminal tab -e "$foo"
    cat $HOME/enumresults/$output/nmap.txt
    if (( i % 2 == 0 )); then  # pause every 2 iterations
        read
    fi
    let "i++"
done
pentools
}

# dirb function
e_dirb(){
  echo -e "\nEnter URL for dirb (eg - https://www.google.com/images/):"
  read dirburl
  echo -e "\nRunning dirb $dirburl "
  dirb $dirburl > $HOME/enumresults/$dirburl/dirb.txt
  echo -e "\nFinished with dirb scan! cat $HOME/enumresults/$dirburl/dirb.txt"
  pentools
}

e_nikto(){
  echo -e "\nEnter the webserver port:"
  read nport
  if ($nport = 443); then
    echo -e "\nRunning nikto --host https://$output --port $nport"
    nikto --host https://$output --port $nport > $HOME/enumresults/$output/nikto-https.txt
    echo -e "\nFinished with nikto scan! cat $HOME/enumresults/$output/nikto.txt"
  else
    echo -e "\nRunning nikto --host http://$output --port $nport"
    nikto --host http://$output --port $nport > $HOME/enumresults/$output/nikto-http.txt
    echo -e "\nFinished with nikto scan! cat $HOME/enumresults/$output/nikto.txt"
  fi
  pentools
}

# enum4linux script
e_e4l(){
echo -e "\nRunning enum4linux -a $output "
enum4linux -a $output>$HOME/enumresults/$output/enum4linux.txt
echo -e "\nFinished with enum4linux scan! cat $HOME/enumresults/$output/enum4linux.txt"
cat $HOME/enumresults/$output/enum4linux.txt
pentools
}

# Wireless tools Menu
e_wireless(){
  echo -e "\nWireless tools have not yet been implemented. Check back"
  pentools
}

# Discover tools Menu
e_discover(){
  xterm -e  "cd /opt/discover/; ./discover.sh ; bash"
  pentools
}

# Hydra Tools Set

e_hydra(){
while :
do
    clear
    cat<<EOF
    ==============================
    Hydra Bruteforce
    ------------------------------
    Please enter your choice:

    SSH                         (1)
    
           (B)ack
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  hydra_ssh ;;
    "B")  mainmenu ;;
    "b")  mainmenu ;;
    "Q")  exit                      ;;
    "q")  exit   ;;
     * )  echo "invalid option"     ;;
    esac

	sleep 1

   done
}

# hydra_ssh menu


# Run the main menu
mainmenu
