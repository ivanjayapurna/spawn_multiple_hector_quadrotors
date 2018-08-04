#!/bin/bash

gnome-terminal --window-with-profile=hold_profile -e "roslaunch hector_quadrotor_gazebo empty_world.launch"

counter=1
while [ $counter -le 2 ]
do
sleep 20
gnome-terminal --window-with-profile=hold_profile -e "roslaunch hector_quadrotor_gazebo x_quadrotors_empty_world.launch nr:=$counter"
((counter++))
done
