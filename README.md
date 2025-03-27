# Automatic-Wifi-Auth

https://hub.docker.com/r/freeradius/freeradius-server

This is a project I started to look into after seeing someone implement it.

Aim of this is to get it up and running - and provide documentation along the way to other users to understand and replicate.


Note to self: Please don't distribute my Certificate Authority





Step ?
Ensure dh_file exists, if not, generate it:

openssl dhparam -out /etc/freeradius/certs/dh 2048



Notes: In order to use this in production: You will need to add:

- clients to the clients.msf
- users in mods-config/files/authorize



Useful Commands:
docker run --rm -it --entrypoint /bin/sh automatic-wifi-auth-freeradius