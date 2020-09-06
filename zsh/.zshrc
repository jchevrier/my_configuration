# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# Former themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"

### Configure Powerlevel9k theme
# Define which fonts are used. Awesome-patched is more portable.
POWERLEVEL9K_MODE="nerdfont-complete"
# Configure prompt display.
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX='%K{240}%F{white} \uF017 %D{%H:%M:%S}  %f%k%F{240}\UE0B0%f '
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%K{240}%F{white} \uF017 %D{%H:%M:%S}  %f%k%F{240}\UE0B0%f '
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs history command_execution_time)

#Configure prompt colors.
POWERLEVEL9K_STATUS_OK_BACKGROUND="238"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="238"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="blue"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="white"
POWERLEVEL9K_OS_ICON_BACKGROUND="016"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="240"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="blue"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="white"
###Disable SVN hooks
POWERLEVEL9K_VCS_SVN_HOOKS=""
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git screen jump)

# Check distribution and add relevant plugin(s).
case `uname` in
	Darwin)
		plugins+=brew
		;;
	Linux)
		case `lsb_release -i | cut -f 2` in
			Ubuntu)
				plugins+=ubuntu
				;;
			Debian)
				plugins+=debian
				;;
			Fedora)
				plugins+=dnf
				;;
			*)
				;;
		esac
		;;
	*)
		;;
esac

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# User specific aliases and functions
alias h='history'
export EDITOR='vim'

# Add save/restore directory
alias sdir="pwd > /tmp/zshrc_savedir"
alias ldir="cd \`cat /tmp/zshrc_savedir\`"

# Override previous Oh-My-Zsh upgrade command and avoid warnings
alias upgrade_oh_my_zsh="omz update"

alias upgrade_p10k="git -C $ZSH_CUSTOM/themes/powerlevel10k pull"

# Update vim packages
alias upgrade_vim="vim +PlugUpdate +PlugUpgrade +PlugClean +qa"

# Load local specific configuration if any.
if [[ -a ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

