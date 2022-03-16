#!/usr/bin/sh
su - postgres  <<EOF
pg_dump -U postgres dspace | gzip > ~/backups/$1
echo "Database backup complete.!"

exit
EOF
