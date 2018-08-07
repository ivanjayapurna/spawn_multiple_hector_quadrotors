# spawn_multiple_hector_quadrotors
Bash script and launch files to spawn multiple hector quadrotors in an emtpy Gazebo world, controlled by ROS nodes.

# Setup:

SETUP:
1. Place the 2 .launch files in /catkin_ws/src/hector_quadrotor/hector_quadrotor_gazebo/launch
2. Go to Terminal > Edit > Profile Preferences > set profile name as “hold_profile” and under command set “When command exits” as “Hold the terminal open”.

If you made any changes, before launch run:
1. catkin_make
2. source devel/setup.bash

# Launch Script:
./spawn_drones.sh 


Notes:
1. this file can be opened up and for loop can be adjusted to control number of drones
2. a new terminal window opens for each drone (i.e. 100 drones = 100 terminal windows (can shift to batches of 5 or 10 in the future)
3. enable_motors of drone can sometimes fail (if it does, enable manually). This is either due to not enough time delay (currently 20 seconds built in, tuned to match my computer's speed) or due to memory issues. Both can be solved by just running command manually in a new terminal.
4. Each drone is called uav1, uav2... etc.
5. Starting y position of each drone is its number - 1 i.e. for uav1: y_pos = 0.0
6. To actually control drones send twist messages i.e.: rostopic pub -r 10 /uav1/cmd_vel geometry_msgs/Twist '{linear: {x: 0.0, y: 0.0, z: 1.0}, angular: {x: 0.0, y: 0.0, z: 0.0}}'

# Useful links for reference:

https://github.com/micpalmia/youbot_ros_tools/wiki/Understanding-launch-and-namespaces
https://askubuntu.com/questions/46627/how-can-i-make-a-script-that-opens-terminal-windows-and-executes-commands-in-the
https://answers.ros.org/question/229489/how-do-i-create-dynamic-launch-files/
https://www.youtube.com/watch?time_continue=890&v=KjxHQLQ0tiE
http://wiki.ros.org/hector_quadrotor/Tutorials/Quadrotor%20outdoor%20flight%20demo



