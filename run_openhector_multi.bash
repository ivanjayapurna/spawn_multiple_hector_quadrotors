#!/bin/bash

let end_for=$1+1
cd /home/muminovic/catkin_ws/src/openwsn_ros/scripts
sed -i.bak "s/for i in range(1,[0-9][0-9]*[0-9]*):/for i in range(1,$end_for):/" node_handler.py
cd /home/muminovic
echo 'done updating node_handler.py for loop'

sudo pkill -9 python 
pid=$!
wait $pid

gnome-terminal --window-with-profile=hold_profile -e "roslaunch hector_quadrotor_gazebo empty_world.launch"
sleep 10
counter=1
while [ $counter -le $1 ]
do
gnome-terminal --window-with-profile=hold_profile -e "roslaunch hector_quadrotor_gazebo x_quadrotors_empty_world.launch nr:=$counter"
((counter++))
done

sleep 20
counter=1
while [ $counter -le $1 ]
do
rosservice call uav$counter/enable_motors "enable: true"
((counter++))
done

cd /home/muminovic/Desktop/openwsn-ros/openwsn-fw
sudo scons board=python toolchain=gcc oos_openwsn

(gnome-terminal -e "bash -c \"rosrun openwsn_ros node_handler.py; exec bash\"")

sleep 5
cd /home/muminovic/Desktop/openwsn-ros/openwsn-sw/software/openvisualizer 

(gnome-terminal -e "bash -c \"sudo scons runweb --sim --simCount=$1 --root='emulated1'; exec bash\"")

rqt_console



