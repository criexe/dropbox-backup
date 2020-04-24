#!/bin/bash

# Author        : Mustafa Aydemir (mustafa@aydemir.im)
# Latest Update : April 24, 2020

# Create Folders
mkdir -p ~/.criexe
mkdir -p ~/.criexe/dropbox-backup

echo "Installing 'Criexe Backup for Dropbox'...";

sudo curl -sSL https://raw.githubusercontent.com/criexe/dropbox-backup/master/backup.sh -o /usr/local/bin/criexe-dropbox-backup
chmod a+x /usr/local/bin/criexe-dropbox-backup

echo "Done!";