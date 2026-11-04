#  ╔═╗╔═╗╦ ╦╦═╗╔═╗  ╔═╗╔═╗╔╗╔╔═╗╦╔═╗	- ffgtfgh
#  ╔═╝╚═╗╠═╣╠╦╝║    ║  ║ ║║║║╠╣ ║║ ╦	- https://github.com/ffgtfgh53/dotfiles
#  ╚═╝╚═╝╩ ╩╩╚═╚═╝  ╚═╝╚═╝╝╚╝╚  ╩╚═╝	- My zsh conf (modified from gh0stzk)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# zmodload zsh/zprof # time .zshrc startup along with zprof at bottom

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0000000" #black
    echo -en "\e]P8585B70" #darkgrey
    echo -en "\e]P1F38BA8" #darkred
    echo -en "\e]P9F38BA8" #red
    echo -en "\e]P2A6E3A1" #darkgreen
    echo -en "\e]PAA6E3A1" #green
    echo -en "\e]P3F9E2AF" #brown
    echo -en "\e]PBF9E2AF" #yellow
    echo -en "\e]P489B4FA" #darkblue
    echo -en "\e]PC89B4FA" #blue
    echo -en "\e]P5F5C2E7" #darkmagenta
    echo -en "\e]PDF5C2E7" #magenta
    echo -en "\e]P694E2D5" #darkcyan
    echo -en "\e]PE94E2D5" #cyan
    echo -en "\e]P7BAC2DE" #lightgrey
    echo -en "\e]PFA6ADC8" #white
    setfont ter-118b
    clear #for background artifacting
fi

#  ┬  ┬┌─┐┬─┐┌─┐
#  └┐┌┘├─┤├┬┘└─┐
#   └┘ ┴ ┴┴└─└─┘
export VISUAL="${EDITOR}"
export EDITOR='geany'
export BROWSER='firefox'
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export SUDO_PROMPT="Deploying root access for %u. Password pls UwU: "
export BAT_THEME="base16"
export GPG_TTY=$(tty)

# taken from https://gist.github.com/bahamas10/542875bb47990933638d2b7dfaa501bf
export MANPAGER='less'
export GROFF_NO_SGR=1
export LESS_TERMCAP_mb=$'\e[5m'
export LESS_TERMCAP_md=$'\e[1;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;33;44m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[4;1;32m'
export LESS_TERMCAP_mr=$'\e[7m'
export LESS_TERMCAP_mh=$'\e[2m'
export LESS_TERMCAP_ZN=$'\e[74m'
export LESS_TERMCAP_ZV=$'\e[75m'
export LESS_TERMCAP_ZO=$'\e[73m'
export LESS_TERMCAP_ZW=$'\e[75m'

if [ -d "$HOME/.local/bin" ] ; then 
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

#  ┬ ┬┬┌─┐┌┬┐┌─┐┬─┐┬ ┬
#  ├─┤│└─┐ │ │ │├┬┘└┬┘
#  ┴ ┴┴└─┘ ┴ └─┘┴└─ ┴
HISTFILE=~/.config/zsh/zhistory
HISTSIZE=5000
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

setopt noclobber

#  ┌─┐┌─┐┬ ┬  ┌─┐┌─┐┌─┐┬    ┌─┐┌─┐┌┬┐┬┌─┐┌┐┌┌─┐
#  ┌─┘└─┐├─┤  │  │ ││ ││    │ │├─┘ │ ││ ││││└─┐
#  └─┘└─┘┴ ┴  └─┘└─┘└─┘┴─┘  └─┘┴   ┴ ┴└─┘┘└┘└─┘
#setopt AUTOCD              # change directory just by typing its name
setopt PROMPT_SUBST        # enable command substitution in prompt
setopt MENU_COMPLETE       # Automatically highlight first element of completion menu
setopt LIST_PACKED	   # The completion menu takes less space.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
setopt interactivecomments # Allow comments that start with '#'
setopt extended_glob       # Allow (#q...) syntax

#  ┬  ┌─┐┌─┐┌┬┐  ┌─┐┌┐┌┌─┐┬┌┐┌┌─┐
#  │  │ │├─┤ ││  ├┤ ││││ ┬││││├┤
#  ┴─┘└─┘┴ ┴─┴┘  └─┘┘└┘└─┘┴┘└┘└─┘
autoload -Uz compinit

export ZSH_COMPDUMP="$HOME/.config/zsh/zcompdump"

if [[ -n ${ZSH_COMPDUMP}(#qN.mh+24) ]]; then
	compinit -i -d "$ZSH_COMPDUMP"
else
	compinit -C -d "$ZSH_COMPDUMP"
fi

if [[ ! -f "${ZSH_COMPDUMP}.zwc" || "$ZSH_COMPDUMP" -nt "${ZSH_COMPDUMP}.zwc" ]]; then
	zcompile -U "$ZSH_COMPDUMP"
fi


autoload -Uz add-zsh-hook
autoload -Uz vcs_info
precmd () { vcs_info }
_comp_options+=(globdots)

zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list \
		'm:{a-zA-Z}={A-Za-z}' \
		'+r:|[._-]=* r:|=*' \
		'+l:|=*'
zstyle ':fzf-tab:*' fzf-flags --style=full --height=90% --pointer '>' \
                --color 'pointer:green:bold,bg+:-1:,fg+:green:bold,info:blue:bold,marker:yellow:bold,hl:gray:bold,hl+:yellow:bold' \
                --input-label ' Search ' --color 'input-border:blue,input-label:blue:bold' \
                --list-label ' Results ' --color 'list-border:green,list-label:green:bold' \
                --preview-label ' Preview ' --color 'preview-border:magenta,preview-label:magenta:bold'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons=always --color=always -a $realpath'
zstyle ':fzf-tab:complete:eza:*' fzf-preview 'eza -1 --icons=always --color=always -a $realpath'
zstyle ':fzf-tab:complete:bat:*' fzf-preview 'bat --color=always --theme=base16 $realpath'
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
zstyle ':fzf-tab:*' accept-line enter

if [ "$TERM" = "linux" ]; then
  zstyle ':vcs_info:*' formats ' %B%s-[%F{yellow}%b%f]-'
else
  zstyle ':vcs_info:*' formats ' %B%s-[%F{magenta}%f %F{yellow}%b%f]-'
fi

#  ┬ ┬┌─┐┬┌┬┐┬┌┐┌┌─┐  ┌┬┐┌─┐┌┬┐┌─┐
#  │││├─┤│ │ │││││ ┬   │││ │ │ └─┐
#  └┴┘┴ ┴┴ ┴ ┴┘└┘└─┘  ─┴┘└─┘ ┴ └─┘
expand-or-complete-with-dots() {
  echo -n "\e[31m…\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

#  ┌┬┐┬ ┬┌─┐  ┌─┐┬─┐┌─┐┌┬┐┌─┐┌┬┐
#   │ ├─┤├┤   ├─┘├┬┘│ ││││├─┘ │
#   ┴ ┴ ┴└─┘  ┴  ┴└─└─┘┴ ┴┴   ┴
function dir_icon {
	if [[ "$PWD" == "$HOME" ]]; then
		echo "%B%F{cyan}%f%b"
	else
		echo "%B%F{cyan}%f%b"
	fi
}

if [[ "$TERM" == "linux" ]]; then
	# no nerd fonts in linux kernel virtual terminal
	PS1='%B%F{magenta}%n%f%b: %B%F{red}%~%f%b${vcs_info_msg_0_} %(?.%B%F{green}>>.%F{red}>>)%f%b '
else
	PS1='%B%F{blue}%f%b  %B%F{magenta}%n%f%b $(dir_icon)  %B%F{red}%~%f%b${vcs_info_msg_0_} %(?.%B%F{green}.%F{red})%f%b '
fi

#  ┌─┐┬  ┬ ┬┌─┐┬┌┐┌┌─┐
#  ├─┘│  │ ││ ┬││││└─┐
#  ┴  ┴─┘└─┘└─┘┴┘└┘└─┘
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[3~' delete-char
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

#  ┌─┐┬ ┬┌─┐┌┐┌┌─┐┌─┐  ┌┬┐┌─┐┬─┐┌┬┐┬┌┐┌┌─┐┬  ┌─┐  ┌┬┐┬┌┬┐┬  ┌─┐
#  │  ├─┤├─┤││││ ┬├┤    │ ├┤ ├┬┘│││││││├─┤│  └─┐   │ │ │ │  ├┤
#  └─┘┴ ┴┴ ┴┘└┘└─┘└─┘   ┴ └─┘┴└─┴ ┴┴┘└┘┴ ┴┴─┘└─┘   ┴ ┴ ┴ ┴─┘└─┘
function xterm_title_precmd () {
	print -Pn -- '\e]2;%n@%m %~\a'
	[[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
	print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
	[[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (kitty*|alacritty*|tmux*|screen*|xterm*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi

#  ┌─┐┬  ┬┌─┐┌─┐
#  ├─┤│  │├─┤└─┐
#  ┴ ┴┴─┘┴┴ ┴└─┘

# system
alias mirrors="sudo reflector --verbose --latest 5 --country 'Singapore' --age 6 --sort rate --save /etc/pacman.d/mirrorlist"
alias update="paru -Syu --nocombinedupgrade"
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# sudo
alias sudo="sudo " # trailing space so second argument is processed too
alias please='sudo $(fc -ln -1)' # re-execute last command with sudo

# utils
alias cpu="auto-cpufreq --stats"
alias copy="xclip -selection clip"
alias trash="gio trash"
alias music="ncmpcpp"

alias comcat="command cat"
alias cat="bat --theme=base16"
alias ls='eza --icons=always --color=always -a'
alias ll='eza --icons=always --color=always -la'
alias icat="kitten icat"

# dotfiles git repo
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# kitty ssh fix
[[ "$TERM" == "kitty" ]] && alias ssh="kitty ssh"

# wake on lan
alias wake-server="wol 00:2b:67:3b:88:d7"

# flashbang on clear
alias clear="clear && printf '\a'"

# langauge specific aliases
alias javar="java -jar"

venv() {
	# Finds and activates the Python venv in the current directory
	# Accepts an argument for a specific directory where the venv is located,
	# or the directory of the venv itself.
	# (useful if the venv is in parent directory)
	local prefix=
	local match=

	# check if venv, else set prefix
	if [[ -v 1 ]]; then
		prefix="${1%/}/" # strip trailing /
		if [[ -e "$prefix"bin/activate ]]; then
			source "$prefix"bin/activate
			return 0
		fi
	fi

	matches=( "${prefix:-}"*venv*/bin/activate(ND) ) 
	case ${#matches} in
		0) 
			echo "No Python virtual environment found in ${prefix:-.}"
			return	
			;;
		
		1) 
			match=${matches[1]} # zsh uses 1-indexing
			;;
		
		*)
			echo "Multiple Python virtual environments found in ${prefix:-.}"
			for i in {1..${#matches}}; do
				echo "$i) ${matches[i]%/bin/activate}"
			done
			
			echo -n "Pick one: [1-${#matches}]: "
			read n
			match=${matches[$n]} 
			[[ -z $match ]] && echo "Invalid input $n" && return
			;;
	esac

	source $match
}

# typos
eval $(thefuck --alias)
alias chomd="chmod"
alias chwon="chown"

#  ┌─┐┬ ┬┌┬┐┌─┐  ┌─┐┌┬┐┌─┐┬─┐┌┬┐
#  ├─┤│ │ │ │ │  └─┐ │ ├─┤├┬┘ │
#  ┴ ┴└─┘ ┴ └─┘  └─┘ ┴ ┴ ┴┴└─ ┴
#$HOME/.local/bin/colorscript -r

# ┌─┐┌─┐┬┌─┌─┐┌┬┐┌─┐┌┐┌  ┌─┐┌─┐┌┐┌┌─┐┬─┐┌─┐┌┬┐┌─┐┬─┐
# ├─┘│ │├┴┐├┤ ││││ ││││  │ ┬├┤ │││├┤ ├┬┘├─┤ │ │ │├┬┘
# ┴  └─┘┴ ┴└─┘┴ ┴└─┘┘└┘  └─┘└─┘┘└┘└─┘┴└─┴ ┴ ┴ └─┘┴└─

if [[ -z $KITTY_HOLD && $TERM_PROGRAM != "vscode" && $TERM != "linux" ]]; then
	command clear # get rid of text typed while compinit
	pokeget --hide-name random 
fi

# zprof # time .zshrc startup with zmodload .zsh/zprof at top
