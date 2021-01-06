# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/ignat/.oh-my-zsh"

# Theme settings
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

##### USER CONFIGURATION ######

# remove hostname for a clean look
prompt_context() {} 

# Set VIM as default editor
export EDITOR='vim'
 
# Set SSH key path for remote desktop usage
export SSH_KEY_PATH="~/.ssh/rsa_id"
 
# Source aliases
if [ -f $HOME/.aliases  ]; then
    source ~/.aliases
else
    echo "ERROR: Couldn't find ~/.aliases"
fi
 
# Source custom commands
if [ -f $HOME/.custom_commands  ]; then
    source ~/.custom_commands
else
    echo "ERROR: Couldn't find ~/.custom_commands"
fi
 
# Distributed ROS
# Use if you are running ROS with multiple machines. Otherwise leave commented out
# export ROS_MASTER_URI=http://192.168.1.102:11311
# export ROS_HOSTNAME=192.168.1.150
# export ROS_IP=192.168.1.150

# CUDA library path. Needed as Nvidia are bad with linux integration
export PATH=$PATH:/usr/local/cuda/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib:/usr/local/lib
export CPLUS_INCLUDE_PATH=/usr/local/cuda/include

