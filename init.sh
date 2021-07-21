#!/bin/bash
eval $(printenv | grep STARTUP | sed -n "s/^\([^=]\+\)=\(.*\)$/export \1=\2/p" | sed 's/"/\\\"/g' | sed '/=/s//="/' | sed 's/$/"/' >> /etc/profile)
set -e
echo $STARTUP
$($STARTUP)