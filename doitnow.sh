#!/bin/bash
# doitnow.sh
# Author: n0logic
# Date: 05/07/2017
# Updated: 06/02/2017
# Basic quick commands for Kali system and various engagement tools.
# Contains a few older scripts from besgood and n0logic as well as
# a few great scripts from the community.

# Import Global config.txt
source config

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
           (B)ack   (Q)uit
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
installmenu(){
while :
do
    clear
    cat<<EOF
    ==============================
    Software and system setup
    ------------------------------
    Please enter your choice:

    Run All Installers         (1)
    Individual Installers      (2)
    System Settings            (3)
    Update and Upgrade Kali    (4)
           (B)ack   (Q)uit
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  i_everything ;;
    "2")  i_individual ;;
    "3")  i_settings ;;
    "4")  i_updatekali ;;
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

    Chromium Browser          (01)
    tor                       (02)
    burpsuite pro             (03)
    Metasploit Pro            (04)
    Synaptic Package Manager  (05)
    Java 8 Installer          (06)
    i386 arch                 (07)
    bleachbit Secure Erase    (08)
    VirtualBox                (09)
    openvas Setup             (10)
    Exploit Pack              (11)
    pwntools CTF Framework    (12)

           (B)ack   (Q)uit
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  i_gchrome ;;
    "2")  i_tor ;;
    "3")  echo -e "\nNot yet implemented" ;;
    "4")  i_msfpro ;;
    "5")  i_synaptic ;;
    "6")  i_java8 ;;
    "7")  i_i386arch ;;
    "8")  i_bleachbit ;;
    "9")  i_virtualbox ;;
    "10")  i_openvas ;;
    "11")  i_exppack ;;
    "12")  i_pwntools ;;
    "B")  installmenu ;;
    "b")  installmenu ;;
    "Q")  exit                      ;;
    "q")  exit   ;;
     * )  echo "invalid option"     ;;
    esac
    sleep 1
done
}

# i_settings - Misc menu settings and shortcuts
i_settings(){
while :
do
    clear
    cat<<EOF
    ==============================
    System settings and shortcuts
    ------------------------------
    Please enter your choice:

    Change root password       (1)
    Create new sudo user       (2)
    Update default SSH keys    (3)
           (B)ack   (Q)uit
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  i_pwdroot ;;
    "2")  i_sudoer ;;
    "3")  i_sshkeys ;;
    "B")  installmenu ;;
    "b")  installmenu ;;
    "Q")  exit                      ;;
    "q")  exit   ;;
     * )  echo "invalid option"     ;;
    esac
    sleep 1
done
}

# i_pwdroot - Change root password
i_pwdroot(){
  echo -e "Press [Enter] to change the root password..."
  read
  xterm -e "passwd root"
  echo -e "Password changed successfully!"
  echo -e "Returning to system settings menu..."
  sleep 1
  i_settings
}

# i_sudoer - Create new user and add to sudoer group
i_sudoer(){
  echo -e "Press [Enter] to create a new user..."
  read
  echo -e "Enter new username:"
  read $iuser
  xterm -e "adduser $iuser ; adduser $iuser sudo"
  echo -e "User created successfully!"
  echo -e "Returning to system settings menu..."
  sleep 1
  i_settings
}

# i_sshkeys - Change default SSH keys
i_sshkeys(){
  echo -e "Press [Enter] to change the default SSH keys..."
  xterm -e "cd /etc/ssh/ && mkdir back ; mv ssh_host_* back ; dpkg-reconfigure openssh-server"
  echo -e "SSH keys successfully updated!"
  echo -e "Returning to system settings menu..."
  sleep 1
  i_settings
}

# i_gchrome - Installs Google Chrome 64bit
i_gchrome(){
  echo -e "Press [Enter] to install the latest version of Chromium x64..."
  read
  xterm -e "apt install chromium -y"
  echo -e "Installation is complete!"
  echo -e "Returning to individual installer menu..."
  sleep 1
  i_individual
}

# i_msfpro - Installs latest Metasploit Pro
i_msfpro(){
  echo -e "Press [Enter] to install the latest version of Metasploit Pro..."
  read
  xterm -e "wget https://downloads.metasploit.com/data/releases/metasploit-latest-linux-x64-installer.run"
  xterm -e "chmod +x metasploit-latest-linux-x64.run ; ./metasploit-latest-linux-x64.run"
  echo -e "Installation is complete!"
  echo -e "Returning to individual installer menu..."
  sleep 1
  i_individual
}

# i_synaptic - Installs synaptic package manager
i_synaptic(){
  echo -e "Press [Enter] to install Synaptic Package Manager..."
  read
  xterm -e "apt install synaptic -y"
  echo -e "Installation is complete!"
  echo -e "Returning to individual installer menu..."
  sleep 1
  i_individual
}

# i_java8 - Installs Java 8 repos and installer
i_java8(){
  echo -e "Press [Enter] to install Java 8..."
  read
  echo -e "Adding Java 8 repositories to sources.list..."
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list
  echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" >> /etc/apt/sources.list
  echo -e "\nAdding repositories keys to keystore..."
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
  echo -e "\nUpdating package lists..."
  sudo apt update
  echo -e "\nInstalling Java 8 Installer..."
  sudo apt install oracle-java8-installer -y
  echo -e "Installation is complete!"
  echo -e "Returning to individual installer menu..."
  sleep 1
  i_individual
}

# i_tor - Installs tor and tor browser
i_tor(){
  echo -e "Press [Enter] to install tor services and browser bundle..."
  read
  xterm -e "apt install tor -y"
  xterm -e "wget https://www.torproject.org/dist/torbrowser/6.5.2/tor-browser-linux64-6.5.2_en-US.tar.xz ; tar xvf tor-browser-linux64-6.5.2_en-US.tar.xz -C $HOME/Desktop/"
  echo -e "Installation is complete!"
  echo -e "Returning to individual installer menu..."
  sleep 1
  i_individual
}

# i_i386arch - Installs the i386 arch
i_i386arch(){
  echo -e "Press [Enter] to install i386 arch..."
  read
  xterm -e "dpkg --add-architecture i386"
  echo -e "Installation is complete!"
  echo -e "Returning to individual installer menu..."
  sleep 1
  i_individual
}

# i_bleachbit - Installs bleachbit secure erase tools
i_bleachbit(){
  echo -e "Press [Enter] to install bleachbit secure erase tool..."
  read
  xterm -e "apt install bleachbit -y"
  echo -e "Installation is complete!"
  echo -e "Returning to individual installer menu..."
  sleep 1
  i_individual
}

# i_virtualbox - Install VirtualBox
i_virtualbox(){
  echo -e "Press [Enter] to install VirtualBox..."
  read
  xterm -e "apt install virtualbox -y"
  echo -e "Installation is complete!"
  echo -e "Returning to individual installer menu..."
  sleep 1
  i_individual
}

# i_openvas - Run the new openvas setup script
i_openvas(){
  echo -e "Press [Enter] to run the openvas setup script..."
  read
  xterm -e "apt install openvas -y ; openvas-setup ; bash"
  echo -e "Installation is complete!"
  echo -e "!!!BE SURE TO NOTE PASSWORD BEFORE CLOSING INSTALL WINDOW!!!"
  echo -e "Returning to individual installer menu..."
  sleep 5
  i_individual
}

# i_exppack - Install the latest Exploit Package
i_exppack(){
  echo -e "Press [Enter] to install the latest Exploit Pack..."
  read
  xterm -e "wget https://github.com/juansacco/exploitpack/archive/master.zip ; unzip exploitpack-master.zip -d /opt/ ; cd /opt/exploitpack-master ; java -jar ExploitPack.jar"
  echo -e "Installation is complete!"
  echo -e "Returning to individual installer menu..."
  sleep 1
  i_individual
}

# i_pwntools - Install the pwntools CTF Framework
i_pwntools(){
  echo -e "Press [Enter] to install the pwntools CTF framework..."
  read
  xterm -e "apt install python2.7 python-pip python-dev git libssl-dev libffi-dev build-essential ; pip install --upgrade pip ; pip install --upgrade pwntools"
  echo -e "Installation is complete!"
  echo -e "Returning to individual installer menu..."
  sleep 1
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
  echo -e "Press [Enter] to begin updating Kali repositories and installing system updates..."
  read
  xterm -e "apt update ; bash"
  xterm -e "apt upgrade -y; bash"
  xterm -e "apt dist-upgrade -y; bash"
  echo -e "\nUpdates are complete!"
  echo -e "\nReturning to software menu..."
  sleep 1
  installmenu
}
# --End-- installmenu - Software Installation Menu

# enum.sh built in woohoo
enumscript(){
  echo -e "n0logic's Enumerate o'matic!\n"
  echo -e "This script will read iplist from current directory and enumerate\n"
  echo -e "each host or IP in the file.\n"
  echo -e "Results will be saved to text documents in your home folder"
  echo -e "------------------------------------------------------------------\n"
  echo -e "\nDo you want to enter an IP (y/n):"
  read yornlist
  if [ $yornlist = n ]; then
    i=1
    for output in $( cat ./iplist.txt )
      do
        g_mkdir
        echo -e "\nRunning nmap -sV -sC $output in new tab"
        foo="nmap -sS -sU -T4 -A -v -PE -PP -PS80,443 -PA3389 -PU40125 -PY -g 53 --script 'default or (discovery)' $output > $HOME/enumresults/$output/nmap.txt"
        gnome-terminal tab -e "$foo"
        cat $HOME/enumresults/$output/nmap.txt
        if (( i % 2 == 0 )); then  # pause every 2 iterations
            read
        fi
        let "i++"
      done
    elif [ $yornlist = y ]; then
      echo -e "\nEnter IP address for nmap scan:"
      read $output
      g_mkdir
      echo -e "\nRunning nmap -sV -sC $output in new tab"
      foo="nmap -sS -sU -T4 -A -v -PE -PP -PS80,443 -PA3389 -PU40125 -PY -g 53 --script 'default or (discovery)' $output > $HOME/enumresults/$output/nmap.txt"
      gnome-terminal tab -e "$foo"
      cat $HOME/enumresults/$output/nmap.txt
    else
      echo -e "\nInvalid option"
    fi
    pentools
}

# dirb function
e_dirb(){
  echo -e "\nEnter URL for dirb (eg - https://www.google.com/images/):"
  read output
  g_mkdir
  echo -e "\nRunning dirb $output "
  dirb $output
  echo -e "\nFinished with dirb scan! cat $HOME/enumresults/$output/dirb.txt"
  pentools
}

e_nikto(){
  echo -e "\nDo you want to enter an IP (y/n):"
  read yornlist
  if [ $yornlist = n ]; then
    i=1
    for output in $( cat ./iplist.txt )
      do
        g_mkdir
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
      done
    elif [ $yornlist = y ]; then
      echo -e "Enter the hostname or IP address:"
      read output
      echo -e "Enter the webserver port:"
      read nport
      g_mkdir
      if ($nport = 443); then
        echo -e "\nRunning nikto --host https://$output --port $nport"
        nikto --host https://$output --port $nport > $HOME/enumresults/$output/nikto-https.txt
        echo -e "\nFinished with nikto scan! cat $HOME/enumresults/$output/nikto.txt"
      else
        echo -e "\nRunning nikto --host http://$output --port $nport"
        nikto --host http://$output --port $nport > $HOME/enumresults/$output/nikto-http.txt
        echo -e "\nFinished with nikto scan! cat $HOME/enumresults/$output/nikto.txt"
      fi
    fi
    pentools
}

# enum4linux script
e_e4l(){
  echo -e "\nDo you want to enter an IP (y/n):"
  read yornlist
  if [ $yornlist = n ]; then
    i=1
    for output in $( cat ./iplist.txt )
      do
        g_mkdir
        echo -e "\nRunning enum4linux -a $output in new tab"
        foo="enum4linux -a $output > $HOME/enumresults/$output/enum4linux.txt"
        gnome-terminal tab -e "$foo"
        cat $HOME/enumresults/$output/enum4linux.txt
      if (( i % 2 == 0 )); then  # pause every 2 iterations
          read
      fi
      let "i++"
    done
  elif [ $yornlist = y ]; then
    echo -e "\nEnter IP address for enum4linux scan:"
    read $output
    g_mkdir
    echo -e "\nRunning enum4linux -a $output in new tab"
    foo="enum4linux -a $output > $HOME/enumresults/$output/enum4linux.txt"
    gnome-terminal tab -e "$foo"
    cat $HOME/enumresults/$output/enum4linux.txt
  else
    echo -e "\nInvalid option"
  fi
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
           (B)ack   (Q)uit
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
  echo -e "\nPress [Enter] to run wifite Wireless auditing tool."
  read
  xterm -e  "wifite ; bash"
  e_wireless
}

fluxion(){
  echo -e "\nPress [Enter] to run fluxion Wireless auditing tool."
  read
  xterm -e  "cd /opt/fluxion/; ./fluxion ; bash"
  e_wireless
}
# End WiFi Section

# Discover tools Menu
e_discover(){
  echo -e "\nPress [Enter] to run Lee Baird's discover script..."
  read
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
    Web Form                    (2)

           (B)ack   (Q)uit
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  hydra_ssh ;;
    "2")  hydra_web ;;
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

           (B)ack   (Q)uit
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
  echo -e "\nEnter the number for desired wordlist."
  echo -e "1) For 10k most common"
  echo -e "2) For 100k most common"
  echo -e "3) For rockyou wordlist"
  echo -e "4) For 1 million most common"
  read wordlist
  if [ $wordlist = 1 ]; then
    echo "hydra -L /opt/SecLists/Usernames/Names/name.txt -P /opt/SecLists/Passwords/10k_most_common.txt ssh://$sshIP"
    hydra -L /opt/SecLists/Usernames/Names/name.txt -P /opt/SecLists/Passwords/10k_most_common.txt ssh://$sshIP
  elif [ $wordlist = 2 ]; then
    echo "hydra -L /opt/SecLists/Usernames/Names/name.txt -P /opt/SecLists/Passwords/10_million_password_list_top_100000.txt ssh://$sshIP"
    hydra -L /opt/SecLists/Usernames/Names/name.txt -P /opt/SecLists/Passwords/10_million_password_list_top_100000.txt ssh://$sshIP
  elif [ $wordlist = 3 ]; then
    echo "hydra -L /opt/SecLists/Usernames/Names/name.txt -P /opt/SecLists/Passwords/rockyou.txt ssh://$sshIP"
    hydra -L /opt/SecLists/Usernames/Names/name.txt -P /usr/share/wordlists/rockyou.txt ssh://$sshIP
  elif [ $wordlist = 4 ]; then
    echo "hydra -L /opt/SecLists/Usernames/Names/name.txt -P /opt/SecLists/Passwords/10_million_password_list_top_1000000.txt ssh://$sshIP"
    hydra -L /opt/SecLists/Usernames/Names/name.txt -P /opt/SecLists/Passwords/10_million_password_list_top_1000000.txt ssh://$sshIP
  else
    echo -e "\nInvalid Option!"
    hydra_ssh_userlist
  fi
	read
  e_hydra
}

# hydra ssh user defined
hydra_ssh_userdefined(){

  echo -e "\nEnter the IP."
  read sshIP
  echo -e "\nEnter the SSH user."
  read user
  echo -e "\nEnter the number for desired wordlist."
  echo -e "1) For 10k most common"
  echo -e "2) For 100k most common"
  echo -e "3) For rockyou wordlist"
  echo -e "4) For 1 million most common"
  read wordlist
  if [ $wordlist = 1 ]; then
    echo "hydra -l /opt/SecLists/Usernames/Names/name.txt -P /opt/SecLists/Passwords/10k_most_common.txt ssh://$sshIP"
    hydra -l $user -P /opt/SecLists/Passwords/10k_most_common.txt ssh://$sshIP
  elif [ $wordlist = 2 ]; then
    echo "hydra -l /opt/SecLists/Usernames/Names/name.txt -P /opt/SecLists/Passwords/10_million_password_list_top_100000.txt ssh://$sshIP"
    hydra -l $user -P /opt/SecLists/Passwords/10_million_password_list_top_100000.txt ssh://$sshIP
  elif [ $wordlist = 3 ]; then
    echo "hydra -l /opt/SecLists/Usernames/Names/name.txt -P /opt/SecLists/Passwords/rockyou.txt ssh://$sshIP"
    hydra -l $user -P /usr/share/wordlists/rockyou.txt ssh://$sshIP
  elif [ $wordlist = 4 ]; then
    echo "hydra -l /opt/SecLists/Usernames/Names/name.txt -P /opt/SecLists/Passwords/10_million_password_list_top_1000000.txt ssh://$sshIP"
    hydra -l $user -P /opt/SecLists/Passwords/10_million_password_list_top_1000000.txt ssh://$sshIP
  else
    echo -e "\nInvalid Option!"
    hydra_ssh_userdefined
  fi
	read
  e_hydra
}

#Hydra web form user choice menu
hydra_web(){
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
           (B)ack   (Q)uit
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  hydra_web_userlist ;;
    "2")  hydra_web_userdefined ;;
    "B")  mainmenu ;;
    "b")  mainmenu ;;
    "Q")  exit                      ;;
    "q")  exit   ;;
     * )  echo "invalid option"     ;;
    esac

	sleep 1

  done
}


# hydra web form with username list
hydra_web_userlist(){
  echo -e "\nPlease enter the base URL or IP. Example URL: http://hack.me"
  read URL
  echo -e "\n Please enter the path to the form, example: /auth/login.php"
  read path
  echo -e "\nEnter username field position."
  read userfield
  echo -e "\nEnter password field position."
  read passfield
  echo -e "\nEnter form submit or login field position."
  read login
  echo -e "\nEnter the number for desired wordlist."
  echo -e "1) For 10k most common"
  echo -e "2) For 100k most common"
  echo -e "3) For rockyou wordlist"
  echo -e "4) For 1 million most common"
  read wordlist
  if [ $wordlist = 1 ]; then
    echo "hydra -L /opt/SecLists/Usernames/Names/name.txt -P /opt/SecLists/Passwords/10k_most_common.txt $url http-post-form '$path:$userfield=^USER^&$passfield=^PASS^&$login=Login:Login failed' -V"
    hydra -L /opt/SecLists/Usernames/Names/name.txt -P /opt/SecLists/Passwords/10k_most_common.txt $url http-post-form "$path:$userfield=^USER^&$passfield=^PASS^&$login=Login:Login failed" -V
  elif [ $wordlist = 2 ]; then
    echo "hydra -L /opt/SecLists/Usernames/Names/name.txt -P /opt/SecLists/Passwords/10_million_password_list_top_100000.txt $url http-post-form '$path:$userfield=^USER^&$passfield=^PASS^&$login=Login:Login failed' -V"
    hydra -L /opt/SecLists/Usernames/Names/name.txt -P /opt/SecLists/Passwords/10_million_password_list_top_100000.txt $url http-post-form "$path:$userfield=^USER^&$passfield=^PASS^&$login=Login:Login failed" -V
  elif [ $wordlist = 3 ]; then
    echo "hydra -L /opt/SecLists/Usernames/Names/name.txt -P /usr/share/wordlists/rockyou.txt $url http-post-form '$path:$userfield=^USER^&$passfield=^PASS^&$login=Login:Login failed' -V"
    hydra -L /opt/SecLists/Usernames/Names/name.txt -P /usr/share/wordlists/rockyou.txt $url http-post-form "$path:$userfield=^USER^&$passfield=^PASS^&$login=Login:Login failed" -V
  elif [ $wordlist = 4 ]; then
    echo "hydra -L /opt/SecLists/Usernames/Names/name.txt -P /opt/SecLists/Passwords/10_million_password_list_top_1000000.txt $url http-post-form '$path:$userfield=^USER^&$passfield=^PASS^&$login=Login:Login failed' -V"
    hydra -L /opt/SecLists/Usernames/Names/name.txt -P /opt/SecLists/Passwords/10_million_password_list_top_1000000.txt $url http-post-form "$path:$userfield=^USER^&$passfield=^PASS^&$login=Login:Login failed" -V
  else
    echo -e "\nInvalid Option!"
    hydra_web_userlist
  fi
  read
  e_hydra
  }


# hydra web form user defined
hydra_web_userdefined(){


  echo -e "\nPlease enter the URL or IP. Example URL: http://hack.me"

  read URL
  echo -e "\nPlease enter the path to form, example: /auth/login.php"
  read path
  echo -e "\nEnter the username."
  read user
  echo -e "\nEnter username field position."
  read userfield
  echo -e "\nEnter password field position."
  read passfield
  echo -e "\nEnter form submit or login field position."
  read login
  echo -e "\nEnter the number for desired wordlist."
  echo -e "1) For 10k most common"
  echo -e "2) For 100k most common"
  echo -e "3) For rockyou wordlist"
  echo -e "4) For 1 million most common"
  read wordlist
  if [ $wordlist = 1 ]; then
    echo "hydra -l $user -P /opt/SecLists/Passwords/10k_most_common.txt $url http-post-form '$path:$userfield=^USER^&$passfield=^PASS^&$login=Login:Login failed' -V"
    hydra -l $user -P /opt/SecLists/Passwords/10k_most_common.txt $url http-post-form "$path:$userfield=^USER^&$passfield=^PASS^&$login=Login:Login failed" -V
  elif [ $wordlist = 2 ]; then
    echo "hydra -l $user -P /opt/SecLists/Passwords/10_million_password_list_top_100000.txt $url http-post-form '$path:$userfield=^USER^&$passfield=^PASS^&$login=Login:Login failed' -V"
    hydra -l $user -P /opt/SecLists/Passwords/10_million_password_list_top_100000.txt $url http-post-form "$path:$userfield=^USER^&$passfield=^PASS^&$login=Login:Login failed" -V
  elif [ $wordlist = 3 ]; then
    echo "hydra -l $user -P /usr/share/wordlists/rockyou.txt $url http-post-form '$path:$userfield=^USER^&$passfield=^PASS^&$login=Login:Login failed' -V"
    hydra -l $user -P /usr/share/wordlists/rockyou.txt $url http-post-form "$path:$userfield=^USER^&$passfield=^PASS^&$login=Login:Login failed" -V
  elif [ $wordlist = 4 ]; then
    echo "hydra -l $user -P /opt/SecLists/Passwords/10_million_password_list_top_1000000.txt $url http-post-form '$path:$userfield=^USER^&$passfield=^PASS^$login=Login:Login failed' -V"
    hydra -l $user -P /opt/SecLists/Passwords/10_million_password_list_top_1000000.txt $url http-post-form "$path:$userfield=^USER^&$passfield=^PASS^&$login=Login:Login failed" -V

  else
    echo -e "\nInvalid Option!"
    hydra_web_userdefined
  fi
  read
  e_hydra
  }



# Run the main menu
mainmenu
