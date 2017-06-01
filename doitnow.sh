#!/bin/bash
# doitnow.sh
# Author: n0logic
# Date: 05/07/2017
# Updated: 05/31/2017
# Basic quick commands for Kali system and various engagement tools.
# Contains a few older scripts from besgood and n0logic as well as
# a few great scripts from the community.

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
    "3")  installmenu ;;
    "4")  echo "Not yet implemented" ;;
    "5")  echo "Not yet implemented" ;;
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

# --Begin-- installmenu - Software Installation Menu
# Option 3 - Updates / Install
intallmenu(){
while :
do
    clear
    cat<<EOF
    ==============================
    Software updates and setup
    ------------------------------
    Please enter your choice:

    Run All Installers         (1)
    Individual Installers      (2)
    Update and Upgrade Kali    (3)
           (B)ack
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  i_everything ;;
    "2")  i_individual ;;
    "3")  i_updatekali ;;
    "B")  mainmenu ;;
    "b")  mainmenu ;;
    "Q")  exit                      ;;
    "q")  exit   ;;
     * )  echo "invalid option"     ;;
    esac
    sleep 1
done
}

# i_individual - Individual Installers
i_individual(){
while :
do
    clear
    cat<<EOF
    ==============================
    Individual Software Installers
    ------------------------------
    Please enter your choice:

    Google Chrome              (1)
    burpsuite pro              (2)
    Metasploit Pro             (3)
           (B)ack
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  i_gchrome ;;
    "2")  echo "Work In Progress" ;;
    "3")  i_msfpro ;;
    "B")  installmenu ;;
    "b")  installmenu ;;
    "Q")  exit                      ;;
    "q")  exit   ;;
     * )  echo "invalid option"     ;;
    esac
    sleep 1
done
}

# i_gchrome - Installs Google Chrome 64bit
i_gchrome(){
  echo -e "Installing the latest version of Google Chrome x64..."
  pause 1
  xterm -e "wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb ; bash"
  xterm -e "dpkg -i google-chrome-stable_current_amd64.deb ; bash"
  echo -e "\Installation is complete!"
  echo -e "\nReturning to individual installer menu..."
  i_individual
}

# i_gchrome - Installs Google Chrome 64bit
i_gchrome(){
  echo -e "Installing the latest version of Google Chrome x64..."
  pause 1
  xterm -e "wget https://downloads.metasploit.com/data/releases/metasploit-latest-linux-x64-installer.run ;  bash"
  xterm -e "chmod +x metasploit-latest-linux-x64.run ; ./metasploit-latest-linux-x64.run ; bash"
  echo -e "\Installation is complete!"
  echo -e "\nReturning to individual installer menu..."
  i_individual
}

# i_everything function - Install most software / tools
i_everything(){
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
  # More added 5/30/2017
  if [ -d /opt/DeathStar/.git ]; then
       echo -e "\e[1;34mUpdating DeathStar.\e[0m"
       cd /opt/DeathStar/ ; git pull
       echo
  else
       echo -e "\e[1;33mInstalling DeathStar.\e[0m"
       git clone https://github.com/byt3bl33d3r/DeathStar.git /opt/DeathStar
       echo
  fi

  if [ -d /opt/fluxion/.git ]; then
       echo -e "\e[1;34mUpdating fluxion WiFi Hacking Toolkit.\e[0m"
       cd /opt/fluxion/ ; git pull
       echo
  else
       echo -e "\e[1;33mInstalling fluxion WiFi Hacking Toolkit.\e[0m"
       git clone https://github.com/wi-fi-analyzer/fluxion.git /opt/fluxion
       cd /opt/fluxion/ ; ./Installer.sh
       echo
  fi
  read -p "Press Enter to Continue"
  # End Here
  installmenu
}

# Update Kali repositories and upgrade only
i_updatekali(){
  echo -e "Updating Kali repositories and install system updates..."
  pause 1
  xterm -e "apt update ; bash"
  xterm -e "apt upgrade ; bash"
  xterm -e "apt dist-upgrade ; bash"
  echo -e "\nUpdates are complete!"
  echo -e "\nReturning to software menu..."
  pause 1
  installmenu
}
# --End-- installmenu - Software Installation Menu

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
while :
do
    clear
    cat<<EOF
    ==============================
    Wireless Tools Main Menu
    ------------------------------
    Please enter your choice:

    Monitor - All Channels     (1)
    Monitor - One Channnel     (2)
    End Monitoring             (3)
    wifite                     (4)
    fluxion                    (6)
           (B)ack
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  airmonall ;;
    "2")  airmon1 ;;
    "3")  endmon ;;
    "4")  wifite ;;
    "5")  fluxion ;;
    "B")  pentools ;;
    "b")  pentools ;;
    "Q")  exit                      ;;
    "q")  exit   ;;
     * )  echo "invalid option"     ;;
    esac
    sleep 1
done
}

airmonall(){
  echo -e "\nPut Wireless adapter into monitor mode on all channels."
  echo -e "\nEnter Wireless device (eg- wlan1):"
  read monitored
  airmon-ng start $monitored
  echo -e "\nWould you like aircrack-ng to kill troublesome services for you? y/n:"
  read killservice
  if ($killservice = y); then
    airmon-ng check kill
  else
    e_wireless
  fi
  e_wireless
}

airmon1(){
  echo -e "\nPut Wireless adapter into monitor mode on a specific channel."
  echo -e "\nEnter Wireless device (eg- wlan1):"
  read monitored
  echo -e "\nEnter channel number:"
  read channelnum
  airmon-ng start $monitored $channelnum
  echo -e "\nWould you like aircrack-ng to kill troublesome services for you? y/n:"
  read killservice
  if ($killservice = y); then
    airmon-ng check kill
  else
    e_wireless
  fi
  e_wireless
}

endmon(){
  echo -e "\nEnd Wireless monitor mode."
  echo -e "\nEnter monitor device (eg- wlan1mon):"
  read mondev
  airmon-ng stop $mondev
  e_wireless
}

wifite(){
  echo -e "\nRunning wifite Wireless auditing tool."
  pause 1
  xterm -e  "wifite ; bash"
  e_wireless
}

fluxion(){
  echo -e "\nRunning fluxion Wireless auditing tool."
  pause 1
  xterm -e  "cd /opt/fluxion/; ./fluxion ; bash"
  e_wireless
}
# End WiFi Section

# Discover tools Menu
e_discover(){
  echo -e "\nRunning Lee Baird's discover script..."
  pause 1
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

#Hydra ssh user choice menu
hydra_ssh(){
while :
do
    clear
    cat<<EOF
    ==============================
    Hydra Bruteforce
    ------------------------------
    Please enter your choice:

    User List                   (1)
    User Defined                (2)

           (B)ack
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  hydra_ssh_userlist ;;
    "2")  hydra_ssh_userdefined ;;
    "B")  mainmenu ;;
    "b")  mainmenu ;;
    "Q")  exit                      ;;
    "q")  exit   ;;
     * )  echo "invalid option"     ;;
    esac

	sleep 1

  done
}


# hydra ssh with username list
hydra_ssh_userlist(){

  echo -e "\nEnter the IP."
  read sshIP
  echo -e "\nPick a wordlist."
  echo -e "\nFor 10k type /opt/SecLists/Passwords/10k_most_common.txt"
  echo -e "\nFor 100k type /opt/SecLists/Password/10_million_password_list_top_100000.txt"
  echo -e "\nFor rockyou type /usr/share/wordlists/rockyou.txt"
  echo -e "\nFor 1 million type /opt/SecLists/Password/10_million_password_list_top_1000000.txt"
  read wordlist
  echo "hydra -L /opt/SecLists/Usernames/Names/name.txt -P $wordlist ssh://$sshIP"
  hydra -L /opt/SecLists/Usernames/Names/name.txt -P $wordlist ssh://$sshIP

	read
  mainmenu
}

# hydra ssh user defined
hydra_ssh_userdefined(){

  echo -e "\nEnter the IP."
  read sshIP
  echo -e "\nEnter the SSH user."
  read user
  echo -e "\nPick a wordlist."
  echo -e "\nFor 10k type /opt/SecLists/Passwords/10k_most_common.txt"
  echo -e "\nFor 100k type /opt/SecLists/Password/10_million_password_list_top_100000.txt"
  echo -e "\nFor rockyou type /usr/share/wordlists/rockyou.txt"
  echo -e "\nFor 1 million type /opt/SecLists/Password/10_million_password_list_top_1000000.txt"
  read wordlist
  echo "hydra -l $user -P $wordlist ssh://$sshIP"
  hydra -l $user -P $wordlist ssh://$sshIP

        read
 mainmenu

}

# Run the main menu
mainmenu
