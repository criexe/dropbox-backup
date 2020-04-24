# Criexe - Dropbox Backup

## Install & Upgrade
```bash
sudo su
curl -sSL https://raw.githubusercontent.com/criexe/dropbox-backup/master/install.sh | sudo bash
```

## Cron
```bash
sudo su
crontab -e

SHELL=/bin/bash
* * */5 * * criexe-dropbox-backup backup >/dev/null 2>&1
```