#!/bin/bash

# Author        : Mustafa Aydemir (mustafa@aydemir.im)
# Latest Update : April 24, 2020

# Create Folders
sudo mkdir -p /.criexe/dropbox-backup
sudo mkdir -p /.criexe/dropbox-backup/hooks
sudo mkdir -p /.criexe/dropbox-backup/backups

# Download Backup Script
sudo curl -sSL https://raw.githubusercontent.com/criexe/dropbox-backup/master/backup.sh -o /usr/local/bin/criexe-dropbox-backup && \
sudo chmod a+x /usr/local/bin/criexe-dropbox-backup

# Hook: Before Backup
[ ! -f /.criexe/dropbox-backup/hooks/before-backup.sh ] && \
sudo curl -sSL https://raw.githubusercontent.com/criexe/dropbox-backup/master/hooks/before-backup.sh -o /.criexe/dropbox-backup/hooks/before-backup.sh && \
sudo chmod a+x /.criexe/dropbox-backup/hooks/before-backup.sh

# Hook: Before Backup
[ ! -f /.criexe/dropbox-backup/hooks/after-backup.sh ] && \
sudo curl -sSL https://raw.githubusercontent.com/criexe/dropbox-backup/master/hooks/after-backup.sh -o /.criexe/dropbox-backup/hooks/after-backup.sh && \
sudo chmod a+x /.criexe/dropbox-backup/hooks/after-backup.sh

echo "Done!";