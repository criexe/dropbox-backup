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

# Daily
SHELL=/bin/bash
0 0 * * * criexe-dropbox-backup backup >/dev/null 2>&1

# Weekly
SHELL=/bin/bash
* * */5 * * criexe-dropbox-backup backup >/dev/null 2>&1
```