#!/bin/sh
SLEEP=sleep
TIME=0.5

# Creating fifo for input
rm -f gravity-fifo;
mkfifo gravity-fifo;

# Prevent closing after echo
sleep 99999999 > gravity-fifo &

# clock
while true
do 
	echo t > gravity-fifo
       	$SLEEP $TIME 
done &

# run game
sed -f gravity.sed gravity-fifo &

# Pass key press to game
(while true 
do
	read -s -n 1 key 
	echo '>'$key'<'
done ) | sed -u -e '/t/d' > gravity-fifo

# finish game
pkill -P $$


