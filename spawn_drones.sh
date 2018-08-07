#!/bin/bash


gnome-terminal --window-with-profile=hold_profile -e "roslaunch hector_quadrotor_gazebo empty_world.launch"
sleep 10
counter=1
while [ $counter -le 3 ]
do
gnome-terminal --window-with-profile=hold_profile -e "roslaunch hector_quadrotor_gazebo x_quadrotors_empty_world.launch nr:=$counter"
sleep 20
rosservice call uav$counter/enable_motors "enable: true"
((counter++))
done
