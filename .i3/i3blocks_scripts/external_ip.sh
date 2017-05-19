#!/bin/sh

IP=$(curl ifconfig.me/ip)

case $BLOCK_BUTTON in
	3) echo "$IP" | tr -d '\n' | xclip -selection clipboard ;;
	*) echo "$IP" ;;
esac
