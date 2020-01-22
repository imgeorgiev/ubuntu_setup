# Path to your oh-my-zsh installation.
export ZSH="/home/ignat/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    zsh-autosuggestions
    vi-mode
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# remove hostname
prompt_context() {} 

# syntax highlighting plugin
source /home/ignat/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### ALIASES ###
alias clion='nohup /opt/clion/bin/clion.sh &'
alias pycharm='nohup /opt/pycharm/bin/pycharm.sh &'

# Quick access to workspaces
alias eufs='source ~/eufs-master/devel/setup.bash && cd ~/eufs-master/'
alias robo='source ~/RoboraceDriver/devel/setup.bash && cd ~/RoboraceDriver/'
alias ros='source /opt/ros/kinetic/setup.bash'


### FUNCTIONS ####
if [ -f $HOME/.custom_commands  ]; then
    source ~/.custom_commands
fi


### ROS SETTINGS ###
# export ROS_MASTER_URI=http://192.168.1.102:11311
# export ROS_HOSTNAME=192.168.1.150
# export ROS_IP=192.168.1.150

### CUDA SETTINGS ###
export PATH=$PATH:/usr/local/cuda/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib:/usr/local/lib
export CPLUS_INCLUDE_PATH=/usr/local/cuda/include


