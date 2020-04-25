#!/bin/bash

# Author        : Mustafa Aydemir (mustafa@aydemir.im)
# Latest Update : April 24, 2020

UPLOADER_SOURCE_URL="https://raw.githubusercontent.com/criexe/dropbox/master/dropbox_uploader.sh";

# Show Creating Dropbox App Guide
function creating_dropbox_app
{
    echo "";
    echo "Connecting Dropbox";
    echo "-------------------------";
    echo "";
    echo "1. Go to 'https://www.dropbox.com/developers/apps/create'";
    echo "2. Select 'Dropbox API'";
    echo "3. Select 'App Folder'";
    echo "4. Enter an app name you want.";
    echo "5. Click 'Create app' button.";
    echo "6. Generate 'Access Token'";
    echo "7. Copy your 'Access Token'";
    echo "";
    echo "-------------------------";
    echo "";
}

# Install Dropbox Uploader
function install_dropbox_uploader
{
    [ -f /usr/local/bin/criexe-dropbox ] && sudo rm /usr/local/bin/criexe-dropbox
    sudo curl -sSL "$UPLOADER_SOURCE_URL" -o /usr/local/bin/criexe-dropbox
    sudo chmod a+x /usr/local/bin/criexe-dropbox
}

# Upgrade
function upgrade
{
    # Create Folders
    sudo mkdir -p ~/.criexe/dropbox-backup 
    sudo mkdir -p ~/.criexe/dropbox-backup/actions/
    sudo mkdir -p ~/.criexe/dropbox-backup/backup/
    chmod -R 777 ~/.criexe/dropbox-backup

    # Download Backup Script
    [ -f /usr/local/bin/criexe-dropbox-backup ] && sudo rm /usr/local/bin/criexe-dropbox-backup;
    sudo curl -sSL https://raw.githubusercontent.com/criexe/dropbox-backup/master/main.sh -o /usr/local/bin/criexe-dropbox-backup && \
    sudo chmod a+x /usr/local/bin/criexe-dropbox-backup

    # Action: Backup
    [ ! -f ~/.criexe/dropbox-backup/actions/backup.sh ] && \
    sudo curl -sSL https://raw.githubusercontent.com/criexe/dropbox-backup/master/actions/backup.sh -o ~/.criexe/dropbox-backup/actions/backup.sh && \
    sudo chmod a+x ~/.criexe/dropbox-backup/actions/backup.sh

    # Install
    clear
    criexe-dropbox-backup install-dropbox-uploader
    criexe-dropbox-backup create-dropbox-app

    echo "Done!";
}

# Edit Config
function edit_config
{
    sudo vi ~/.criexe/dropbox-backup/actions/backup.sh
}

# Backup
function backup
{
    # Clear backup folder
    [ -d ~/.criexe/dropbox-backup/backup/ ] && sudo rm -R ~/.criexe/dropbox-backup/backup/
    sudo mkdir -p ~/.criexe/dropbox-backup/backup/
    sudo chmod -R 777 ~/.criexe/dropbox-backup/backup/

    # Include backup action
    . ~/.criexe/dropbox-backup/actions/backup.sh

    # Upload Files
    sudo criexe-dropbox upload \
        ~/.criexe/dropbox-backup/backup/* \
        /Backups/$(date +"%Y-%m-%d")/

    # Remove Files
    rm -R ~/.criexe/dropbox-backup/backup/*
}

if [ -z $1 ]; then
    echo "Criexe - Auto Backup to Dropbox";
else

    # Install Dropbox Uploader
    if [ $1 == "install-dropbox-uploader" ]; then
        install_dropbox_uploader
    fi

    # Upgrade
    if [ $1 == "upgrade" ]; then
        upgrade
    fi

    # Show Creating Dropbox App Guide
    if [ $1 == "create-dropbox-app" ]; then
        creating_dropbox_app
    fi

    # Config
    if [ $1 == "config" ]; then
        edit_config
    fi

    # Backup
    if [ $1 == "backup" ]; then
        backup
    fi

    # Cron
    if [ $1 == "cron" ]; then
        backup
        upgrade
    fi

fi