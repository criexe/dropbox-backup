# Criexe - Dropbox Backup

## Install
```bash
sudo su
curl -sSL https://raw.githubusercontent.com/criexe/dropbox-backup/master/install.sh | sudo bash && [ ! -f ~/.criexe/.dropbox ] && read -r CRIEXE_OAUTH_ACCESS_TOKEN && echo "OAUTH_ACCESS_TOKEN=$CRIEXE_OAUTH_ACCESS_TOKEN" > ~/.criexe/.dropbox
```

## Upgrade
```bash
criexe-dropbox-backup upgrade
```

### Reset Settings & Upgrade
```bash
criexe-dropbox-backup reset-config && criexe-dropbox-backup upgrade
```

## Cron
```bash
sudo su
crontab -e

# Daily
SHELL=/bin/bash
0 0 * * * /usr/local/bin/criexe-dropbox-backup cron >/dev/null 2>&1

# Weekly
SHELL=/bin/bash
* * */5 * * /usr/local/bin/criexe-dropbox-backup cron >/dev/null 2>&1
```

## Config
### Edit Config File
```bash
criexe-dropbox-backup config
```

### Reset Config File
```bash
criexe-dropbox-backup reset-config
```

## Backup Manually
```bash
criexe-dropbox-backup backup
```