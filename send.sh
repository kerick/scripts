#!/bin/bash
# Arguments: remotehost remoteport
# GNU netcat receive side: nc l -u -p remoteport remotehost # probably want to redirect to some file >>>>>>>>>>
# BSD netcat receive side: nc -ul remotehost remoteport # probably want to redirect to some file >>>>>>>>>>
mkfifo ncfifo
nc -p 20000 -u $@ < ncfifo > ncfifo &
NCPID=$(jobs -p %%)
#while [true]
#do
for i in {0..999}
do
	echo "$(date +%s.%N) $i" > ncfifo 
	sleep 0.01
done
#done
kill $NCPID
rm ncfifo
