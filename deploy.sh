#!/bin/bash

help()
{
   echo ""
   echo "Usage: $0 -u username -d mydomain.com"
   echo -e "\t-u bento.me username (bento.me/<username>)"
   echo -e "\t-d Domain name (mydomain.com)"
   echo -e "\t-h Prints script usage help"
   exit 1
}

while getopts "u:d:h" opt
do
   case "$opt" in
      u ) u="$OPTARG" ;;
      d ) d="$OPTARG" ;;
      h ) help ;;
      ? ) help ;; # prints help command for non-existing parameters
   esac
done

# if no parameters
if [ -z "$u" ] || [ -z "$d" ]
then
   echo "One or more parameters are missing. Please, check the script help below.";
   help
fi

# remove the old nginx config file if exists
printf "Removing the old nginx.conf file...\n"
rm -f nginx.conf

# replace the variables in the nginx config file
printf "Replacing variables in nginx.conf file...\n"
sed "s|<DOMAIN>|$d|g; s|<USERNAME>|$u|g" nginx.conf.example > nginx.conf

# deploy the app
printf "Deploying the app...\n"
flyctl launch --copy-config

# issue SSL certificate
printf "Issuing SSL certificate...\n"
flyctl certs add $d -c ./fly.toml