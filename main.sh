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
}

# Install Dropbox Uploader
function install_dropbox_uploader
{
    sudo curl -sSL "$UPLOADER_SOURCE_URL" -o /usr/local/bin/criexe-dropbox
    sudo chmod a+x /usr/local/bin/criexe-dropbox
}

# Install
function install
{
    sudo curl "$UPLOADER_SOURCE_URL" -o /usr/local/bin/criexe-dropbox
    sudo chmod a+x /usr/local/bin/criexe-dropbox
}

if [ -z $1 ]; then
    echo "Criexe - Auto Backup to Dropbox";
else

    # Install Dropbox Uploader
    if [ $1 == "install-dropbox-uploader" ]; then
        install_dropbox_uploader
    fi

    # Install
    if [ $1 == "install" ]; then
        install
    fi

    # Show Creating Dropbox App Guide
    if [ $1 == "create-dropbox-app" ]; then
        creating_dropbox_app
    fi

    # Config
    if [ $1 == "config" ]; then
        echo "Config";
        sudo mkdir -p ~/.criexe/dropbox-backup
        sudo touch ~/.criexe/dropbox-backup/backup.config
    fi

    # Backup
    if [ $1 == "backup" ]; then

        # Clear backup folder
        [ ! -d /.criexe/dropbox-backup/backup/ ] && sudo rm -R /.criexe/dropbox-backup/backup/
        sudo mkdir -p /.criexe/dropbox-backup/backup/

        # Include backup action
        . /.criexe/dropbox-backup/actions/backup.sh

        # Upload Files
        sudo criexe-dropbox upload \
            /.criexe/dropbox-backup/backup/* \
            /$(date +"%Y-%m-%d")/
            
    fi

fi