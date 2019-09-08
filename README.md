# ubuntu-setup
A guide of how to install my Ubuntu config which is focused on robotics development with ROS

## 1. Linux distro
For most of my projects, I use ROS which bounds me to use Ubuntu. So first install your fav [ubuntu flavour](https://ubuntu.com/download/flavours) and install it.

## 2. Install all ubuntu apps
-Just run the script `install.sh` with sudo to install everything.
2Otherwise, you are free to install whatever you fancy
2
## 3. Manually install external apps
- [CLion](https://www.jetbrains.com/clion/download/#section=linux) - remember to sync settings
- [PyCharm](https://www.jetbrains.com/pycharm/download/#section=linux) - remember to sync settings		
- [TeamViewer](https://www.teamviewer.com/en/download/linux/)
- [Slack](https://slack.com/downloads/linux)
- [Anaconda](https://www.anaconda.com/download/) - Note that Anaconda has some issues running with ROS. For this purpose remove the path sourcing for it from `.bashrc` and source it only whenever needed. For that purpose I have made a custom command called `start_conda` within the `.custom_commands.bash` file
- Install VSCode extensions using the Settings Sync extension from the VSCode marketplace


## 4. Customisations
### Visual
- [Arc X Darker Theme](https://gitlab.com/LinxGem33/X-Arc-White) - Can be downloaded as a .deb package which you can simply install. Then you have to change your theme from both the *Apperance* and *Window Manager* apps.
- [Arc X Icons] - Installed from install scripts folder

### Keyboard shortcuts
- File Manager - Super + E
- Apps Menu - Super + R
- Terminal - Ctrl + Alt + T
- Switch workspaces - Ctrl + Alt + Arrow keys
- Move window to workspace - Super + Arrow keys
- Switch keyboard layouts - Alt + Shift

### Useful scripts
- `stop_joy.bash` - when you connect a some joysticks to ubuntu, they start controlling your mouse. This script stops that but allows the joystick to still work as a joystick.
- `wifi_fix.bash` - on my Dell Latitude E5450, my wifi would sometimes refuse to connect to secure networks. This script fixes it for 1 connection attempt.

### Remote file connections
Usually access these through the Nautalis Connect to Server menu
- `sftp://ssh.inf.ed.ac.uk/afs/inf.ed.ac.uk/user/s15/s1521716` - Uni DICE filesystem

### Git setup
1. Setup [SSH key](https://docs.gitlab.com/ee/ssh/) for gitlab.
2. Use `git config credential.helper store` to save credentials


### ODrive setup
Just run ODrive
