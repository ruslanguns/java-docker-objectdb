#!/bin/sh

chmod u+x server.sh

sed -i 's/DB_PORT/'"$DB_PORT"'/g' config.xml
sed -i 's/DB_USERNAME/'"$DB_USERNAME"'/g' config.xml
sed -i 's/DB_PASSWORD/'"$DB_PASSWORD"'/g' config.xml

rm -rf ../tutorials
rm -rf ../doc

/bin/bash ./server.sh -conf config.xml start