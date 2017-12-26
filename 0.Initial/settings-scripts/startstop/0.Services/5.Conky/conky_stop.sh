#!/bin/bash

	if pidof conky | grep [0-9] > /dev/null
then
	exec killall conky
else
   exit
   fi