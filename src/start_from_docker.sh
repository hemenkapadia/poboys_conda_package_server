#!/bin/bash

# bail on error
set -e 

echo "Activating conda env..."
source activate poboys_env

# copy everything from staging,this will ensure latest code is in dir that runs server
cp -ax /opt/poboys_staging/* /opt/poboys_conda_package_server
cd /opt/poboys_conda_package_server

if [ -n "$POBOYS_PORT" ]; then
    ARGS="--port $POBOYS_PORT"
fi

# if we are storing in S3 then sync from there (just in case we are missing anything locally)
if [ -n "$POBOYS_S3_BUCKET" ]; then
    ARGS="$ARGS"" --s3_bucket $POBOYS_S3_BUCKET"
    mkdir -p pkgs
    aws s3 sync s3://"$POBOYS_S3_BUCKET" pkgs
fi

# provide anaconda username and password to allow login
if [[ -n "$ANACONDA_USERNAME" && -n "$ANACONDA_PASSWORD" ]]; then
    ARGS="$ARGS"" --ac_user $ANACONDA_USER --ac_pass $ANACONDA_PASSWORD"
fi

# if anaconda org is provided, upload to org.
# By default, packages will be uploaded to the user account
if [[ -n "$ANACONDA_ORG" ]]; then
    ARGS="$ARGS"" --ac_org $ANACONDA_ORG"
fi

echo "Serving..."
python poboys_conda_package_server.py $ARGS
