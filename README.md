ETJump server
==================
This project is modified from https://github.com/msh100/Docker-Images/
Credits to https://github.com/msh100 for setting up an example that is easily extended. I added a few small improvements(checking if maps are already downloaded on restarts for example) and modified the image to be hosting an etjump server.

This Docker image will download the required ET maps as specified in the `MAPS` environment variable (from `REDIRECTURL`) and then spawn an ETJump server with configuration as defined in the environment variables or their defaults (refer below).

All logs are written to STDOUT so can be viewed from `docker logs` or run without the `-d` Docker run switch.

Example
-------

```
docker run -d \
  -p "10.0.0.1:27960:27960/udp" \
  -e "MAPS=gammaland_b2" \
  -e "REFEREEPASSWORD=pass123" \
  msh100/etpro
```

Configuration Options
---------------------

Environment Variable | Description                    | Defaults
-------------------- | ------------------------------ | ----------------------------------------------
MAPS                 | List of maps seperated by ':'. | Some tj maps
PASSWORD             | Server password.               | No password.
RCONPASSWORD         | RCON password.                 | No password (disabled).
REFEREEPASSWORD      | Referee password.              | No password (disabled).
SCPASSWORD           | Shoutcaster password.          | No password (disabled).
HOSTNAME             | Server hostname.               | Docker hostname.
STARTMAP             | Map server starts on.          | gamma_mill_b4
REDIRECTURL          | URL of HTTP downloads          | http://163.172.51.202/download/
MAP_PORT             | Container port (internal)      | 27960
NOQUERY              | Disable status queries         | Disabled, set to `true` to enable.