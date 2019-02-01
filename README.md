# vrstorygram
startup for VRStoryGram

## Azure Container Service setup

Web App + MySQL : This creates an App Service plus a MySQL Database

## Running in Docker on Linux

docker run -d --env mysql_database=*MySQL DB Name* \
    --env mysql_host=*MySQL host* \
    --env mysql_userid=*MySQL Username* \
    --env mysql_password=*MySQL Password* \
    -p 80:80 -p 2022:2222 tfournet/vrstorygram-docker


