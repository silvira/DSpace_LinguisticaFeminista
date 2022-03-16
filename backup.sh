#!/usr/bin/sh


database=$(date +'%Y%m%d''dspace.gz')
backup=$(date +'%Y%m%d''dspace_app.zip')
#su - postgres  <<EOF
#pg_dump -U postgres dspace | gzip > ~/backups/$database
#echo "Database backup complete.!"

#exit 1
sudo bash /home/dspace/backups/backup_db.sh $database

echo "moving db backup to dspace backups directory.!"
sudo mv  /var/lib/postgresql/backups/$database  /home/dspace/backups/$database

echo "archiving directories to zip files.!"
# sudo zip -qdgds /home/dspace/backups/$backup  -r /dspace  /opt/tomcat /opt/solr/ /home/dspace/backups/$database /var/solr/data
sudo zip /home/dspace/backups/$backup  -r  /dspace  /opt/tomcat /opt/solr/ /home/dspace/backups/$database /var/solr/data
sudo rm /home/dspace/backups/$database


echo "operation complete.!"
