#!/bin/bash
APPNAME="LinuxCom"
VERSION="1.0"
RESOURCES="ressources"
AIMG="appimages"
ACONF="appconf"
AUTHOR="DanLP6"
APP="ressources/apps"
LINK="ressources/desktopfiles"
ICO="ressources/ico"
#AppImages dont have a filEcAsEsEnSiTiVe Writing
#Apps count like AppImages
#Desktopfiles do have a casesensitive writing only lowercase
#Configs are written like the AppImagename
#Icons have the exact same names as AppImages the exact SAME!

#Some checks about whether you are root
if [ "$EUID" -ne 0 ]; then
    echo "Please $APPNAME run as root to avoid problems."
    exit 1
fi                                                              #comment out to make this script intercompatible
if ! grep -q -i 'debian' /etc/os-release; then                  #comment out to make this script intercompatible
    echo "This script can only be run on Debian-based systems." #comment out to make this script intercompatible
    exit 1                                                      #comment out to make this script intercompatible
else
#I have no idea what to write here
    echo "Make sure that you have altered the things according to the OS!!! Else Dragons!!!"
    sleep 1
    echo "Proceeding with installation in 10 secounds if no termination action (CRTL+C) is taken"
    sleep 10
    echo "Installing $APPNAME $VERSION by $AUTHOR"
    sudo mkdir /opt/                                            #This one should exist but you know Linux and they sometime messes up just don't delete this!
    sudo mkdir /opt/AppImage
    sudo mkdir /usr/share/applications/appimagesdlp6
    sudo chmod 777 /opt/AppImage
    sudo mkdir /opt/AppImage/unpacker
    sudo dpkg -i $RESOURCES/apps/alacarte.deb                   #comment out to make this script intercompatible
#    sudo mkdir /usr/share/applications/appimagedlp6
#Creating Core Prep Dirs & Working Dir
    sudo cp -r $AIMG/* /opt/AppImage/
    sudo cp -r $RESOURCES/* /opt/AppImage/unpacker/res
    sudo cp -r $ACONF/* /opt/AppImage/unpacker/config
    sudo cp -r $APP/* /opt/AppImage/unpacker/apps
    sudo cp -r $LINK/* /opt/AppImage/unpacker/desktopfiles
    sudo cp -r $ICO/* /opt/AppImage/
    sudo chmod +x /opt/AppImage/*
    echo "Installing Core Apps"
# LibreWolf
    echo "Installing LibreWolf"
    sudo mv /opt/AppImage/unpacker/desktopfiles/librewolf.desktop /usr/share/applications/appimagesdlp6/
#    sudo mv /opt/AppImage/unpacker/config/LibreWolf wheretfaretheconfigsinlinux
# Altus
    echo "Installing Altus"
    sudo mv /opt/AppImage/unpacker/desktopfiles/altus.desktop /usr/share/applications/appimagesdlp6/
#    sudo mv /opt/AppImage/unpacker/config/Altus wheretfaretheconfigsinlinux
# Discord
    echo "Installing Discord"
    sudo mv /opt/AppImage/unpacker/desktopfiles/discord.desktop /usr/share/applications/appimagesdlp6/
#    sudo mv /opt/AppImage/unpacker/config/Discord wheretfaretheconfigsinlinux
# FreeTube
    echo "Installing FreeTube"
    sudo mv /opt/AppImage/unpacker/desktopfiles/freetube.desktop /usr/share/applications/appimagesdlp6/
#    sudo mv /opt/AppImage/unpacker/config/FreeTube wheretfaretheconfigsinlinux
# Intellij
    echo "Installing Intelij"
    sudo mv /opt/AppImage/unpacker/desktopfiles/intelij.desktop /usr/share/applications/appimagesdlp6/
#    sudo mv /opt/AppImage/unpacker/config/Intelij wheretfaretheconfigsinlinux
# OnlyOffice
    echo "Installing OnlyOffice"
    sudo mv /opt/AppImage/unpacker/desktopfiles/onlyoffice.desktop /usr/share/applications/appimagesdlp6/
#    sudo mv /opt/AppImage/unpacker/config/OnlyOffice wheretfaretheconfigsinlinux
# Spotify
    echo "Installing Spotify"
    sudo mv /opt/AppImage/unpacker/desktopfiles/spotify.desktop /usr/share/applications/appimagesdlp6/
#    sudo mv /opt/AppImage/unpacker/config/Spotify wheretfaretheconfigsinlinux

    echo "Do You want to install additional packages? [Y/n] \n"
    read ADDPACK
    if [[ "$ADDPACK" == "Y" || "$ADDPACK" == "y" || "$ADDPACK" == "yes" || "$ADDPACK" == "Yes" ]]; then
        echo "\n Continuing..."
        sudo apt install virt-manager btop gnome-* -Y  #Well you have to get you packages by yourself if you need to use arch
        sudo pacman -S virt-manager btop gnome-*       #NVM it has arch too
    else
        echo "\n Exiting now"
        sleep 1
        exit 1
fi

fi
