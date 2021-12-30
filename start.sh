#!/usr/bin/env bash

PASSWORD=${PASSWORD:"ChangeMe"}

#update user
PUID=${PUID:-911}
PGID=${PGID:-911}

groupmod -o -g "$PGID" user
usermod -o -u "$PUID" user
echo "UID: $PUID"
echo "GID: $PGID"

echo -e "$PASSWORD\n$PASSWORD\n" | passwd user

/usr/sbin/xrdp -n -f
