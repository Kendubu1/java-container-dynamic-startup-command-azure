# Java Container Dynamic Startup Command - POC
This sample leverages a startup script as the entrypoint. This script allows us to reference an App Setting as our startup command to have the flexiblity of changing & modifying the command without rebuilding the image.
### Init Script
The application will require the "STARTUP" app setting configured before deployment since it will be referenced as our startup command.
```sh
#!/bin/bash
eval $(printenv | grep STARTUP | sed -n "s/^\([^=]\+\)=\(.*\)$/export \1=\2/p" | sed 's/"/\\\"/g' | sed '/=/s//="/' | sed 's/$/"/' >> /etc/profile)
set -e
echo $STARTUP
$($STARTUP)
```
### Add the App Setting "STARTUP" via Azure CLI
```sh
az webapp config appsettings set --resource-group <group-name> --name <app-name> --settings STARTUP="java -jar /spring-boot-0.0.1-SNAPSHOT.jar"
```

### ACR Deployment
```sh
$ git clone https://github.com/Kendubu1/java-container-dynamic-startup-command-azure && cd java-container-dynamic-startup-command-azure
$ docker login <user>.azurecr.io
$ docker build -t <user>.azurecr.io/javadynamicpoc:01 .
$ docker push <user>.azurecr.io/javadynamicpoc:01
```
