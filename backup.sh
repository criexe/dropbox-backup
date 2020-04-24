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
    chmod a+x /usr/local/bin/criexe-dropbox
}

# Install
function install
{
    sudo curl "$UPLOADER_SOURCE_URL" -o /usr/local/bin/criexe-dropbox
    chmod a+x /usr/local/bin/criexe-dropbox
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
        install_dropbox_uploader
    fi

    # Backup
    if [ $1 == "backup" ]; then
        echo "Backup";
    fi

    # Show Creating Dropbox App Guide
    if [ $1 == "create-dropbox-app" ]; then
        creating_dropbox_app
    fi

fi