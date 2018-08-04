# spawn_multiple_hector_quadrotors
Bash script and launch files to spawn multiple hector quadrotors in an emtpy Gazebo world, controlled by ROS nodes.

# Launch Instructions:

SETUP:
Place the 2 .launch files in /catkin_ws/src/hector_quadrotor/hector_quadrotor_gazebo/launch

IF YOU MADE ANY CHANGES:
catkin_make
source devel/setup.bash

ELSE IF MANUAL EDIT OF # DRONES:
Terminal 1:
roslaunch hector_quadrotor_gazebo x_quadrotors_empty_world.launch nr:=2

Terminal 2:
rosservice call /uav1/enable_motors “enable: true”
NOTE: repeat this command for each uavX you have (TODO: write a script to automatically do this)

Terminal 3:
Send Twist messages
rostopic pub -r 10 /uav1/cmd_vel geometry_msgs/Twist '{linear: {x: 0.0, y: 0.0, z: 1.0}, angular: {x: 0.0, y: 0.0, z: 0.0}}'

# ELSE (automated script):
./spawn_drones.sh 

NOTE 1:  this file can be opened up and for loop can be adjusted to control number of drones
NOTE 2: a new terminal window opens for each drone (i.e. 100 drones = 100 terminal windows (can shift to batches of 5 or 10 in the future)
NOTE 3: still need to enable_motors for each drone (can be built into script pretty easily)
NOTE 4: To work need to Terminal > Edit > Profile Preferences > set profile name as “hold_profile” and under command set “When command exits” as “Hold the terminal open”.
NOTE 5: EACH DRONE IS JUST CALLED 1,2,3 etc. (starting y_pos is name - 1)

# Useful links for reference:

https://github.com/micpalmia/youbot_ros_tools/wiki/Understanding-launch-and-namespaces
https://askubuntu.com/questions/46627/how-can-i-make-a-script-that-opens-terminal-windows-and-executes-commands-in-the
https://answers.ros.org/question/229489/how-do-i-create-dynamic-launch-files/
https://www.youtube.com/watch?time_continue=890&v=KjxHQLQ0tiE
http://wiki.ros.org/hector_quadrotor/Tutorials/Quadrotor%20outdoor%20flight%20demo



