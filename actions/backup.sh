# Action: Backup
# --------------

ZIP: Files
sudo zip -9 -r \
    \
    /~/.criexe/dropbox-backup/backup/files.zip \
    \
    /home/
    /var/www/
    /etc/nginx/ \
    /etc/apache2/ \
    /root/.zshrc \
    /root/.profile \
    /root/.ssh \
    \
    -x '*/.git/*' \
    -x '*/node_modules/*' \
    -x '*.DS_Store*'

# MySQL
sudo mysqldump -uroot --all-databases > /~/.criexe/dropbox-backup/backup/mysql.sql