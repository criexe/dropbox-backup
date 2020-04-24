#!/bin/bash

# Author        : Mustafa Aydemir (mustafa@aydemir.im)
# Latest Update : April 24, 2020

# Create Folders
sudo mkdir -p /.criexe/dropbox-backup 
sudo mkdir -p /.criexe/dropbox-backup/actions/
sudo mkdir -p /.criexe/dropbox-backup/backup/
chmod -R 777 /.criexe/dropbox-backup

# Download Backup Script
[ -f /usr/local/bin/criexe-dropbox-backup ] && sudo rm /usr/local/bin/criexe-dropbox-backup;
sudo curl -sSL https://raw.githubusercontent.com/criexe/dropbox-backup/master/main.sh -o /usr/local/bin/criexe-dropbox-backup && \
sudo chmod a+x /usr/local/bin/criexe-dropbox-backup

# Action: Backup
[ ! -f /.criexe/dropbox-backup/actions/backup.sh ] && \
sudo curl -sSL https://raw.githubusercontent.com/criexe/dropbox-backup/master/actions/backup.sh -o /.criexe/dropbox-backup/actions/backup.sh && \
sudo chmod a+x /.criexe/dropbox-backup/actions/backup.sh

# Install
clear
criexe-dropbox-backup install-dropbox-uploader
criexe-dropbox-backup create-dropbox-app
criexe-dropbox

echo "Done!";