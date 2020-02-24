export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR=vim

declare -A ZPLGM
ZPLGM[MUTE_WARNINGS]=1

export CACHE_DIR="$HOME/.cache"

[[ ! -d "$CACHE_DIR" ]] && mkdir -p "$CACHE_DIR"

# history settings
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export HISTFILE="$CACHE_DIR/.zsh_history"
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

setopt promptsubst

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa

source ~/.zplugin/bin/zplugin.zsh

# FPATH=/usr/local/share/zsh-completions:$FPATH

zplugin light zdharma/zui
zplugin light zdharma/zplugin-crasis

zplugin light zsh-users/zsh-completions
zplugin light zsh-users/zsh-autosuggestions

zpcompinit

zplugin light zdharma/fast-syntax-highlighting

# zplugin load zdharma/history-search-multi-word
zplugin light zsh-users/zsh-history-substring-search

zplugin ice from"gh-r" as"program" mv"direnv* -> direnv" \
  atclone"./direnv hook zsh > zhook.zsh" atpull"%atclone" src"zhook.zsh" pick"direnv"
zplugin light direnv/direnv

# zplugin ice atclone"dircolors -b LS_COLORS > c.zsh" atpull"%atclone" \
#   pick"c.zsh" nocompile"!"
# zplugin light trapd00r/LS_COLORS

zplugin ice "rupa/z" pick"z.sh"
zplugin light "rupa/z"

zplugin ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX" nocompile
zplugin light tj/git-extras

zplugin ice as"completion" atclone"python ./get-poetry.py; \
    $HOME/.poetry/bin/poetry completions zsh > _poetry" \
    atpull"%atclone" atload'PATH+=:$HOME/.poetry/bin'
zplugin light sdispater/poetry

zplugin snippet OMZ::lib/clipboard.zsh
zplugin snippet OMZ::lib/compfix.zsh
zplugin snippet OMZ::lib/completion.zsh
zplugin snippet OMZ::lib/correction.zsh
zplugin snippet OMZ::lib/diagnostics.zsh
zplugin snippet OMZ::lib/directories.zsh
zplugin snippet OMZ::lib/functions.zsh
zplugin snippet OMZ::lib/git.zsh
zplugin snippet OMZ::lib/grep.zsh
zplugin snippet OMZ::lib/history.zsh
zplugin snippet OMZ::lib/key-bindings.zsh
zplugin snippet OMZ::lib/misc.zsh
zplugin snippet OMZ::lib/termsupport.zsh
zplugin snippet OMZ::lib/theme-and-appearance.zsh

zplugin snippet OMZ::plugins/asdf/asdf.plugin.zsh
zplugin snippet OMZ::plugins/aws/aws.plugin.zsh
# zplugin snippet OMZ::plugins/brew/brew.plugin.zsh
zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
# zplugin snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
# zplugin snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh
zplugin snippet OMZ::plugins/encode64/encode64.plugin.zsh
zplugin snippet OMZ::plugins/fzf/fzf.plugin.zsh
zplugin ice wait"0" lucid atload"unalias grv"
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/gpg-agent/gpg-agent.plugin.zsh
zplugin snippet OMZ::plugins/iterm2/iterm2.plugin.zsh
zplugin ice wait lucid
zplugin snippet OMZ::plugins/pip/pip.plugin.zsh
zplugin snippet OMZ::plugins/python/python.plugin.zsh
zplugin snippet OMZ::plugins/rsync/rsync.plugin.zsh
zplugin snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh
zplugin snippet OMZ::plugins/terraform/terraform.plugin.zsh
zplugin snippet OMZ::plugins/virtualenv/virtualenv.plugin.zsh

zplugin ice wait lucid
zplugin snippet https://github.com/ahmetb/kubectl-aliases/blob/master/.kubectl_aliases

zplugin ice as"completion" id-as"dkr-complete"
zplugin load docker/cli

zplugin ice as"completion" id-as"dc-complete"
zplugin load docker/compose

zplugin ice wait as"completion" lucid
zplugin snippet OMZ::plugins/terraform/_terraform

zplugin ice wait as"completion" lucid
zplugin snippet OMZ::plugins/vault/_vault

zplugin ice has'minikube' id-as'minikube' as"null" wait silent nocompile \
        atclone'minikube completion zsh >! _minikube' \
        atpull'%atclone' src"_minikube" run-atpull \
        atload'zpcdreplay'
zplugin light zdharma/null

zplugin ice has'helm' id-as'helm' as"null" wait silent nocompile \
        atclone'helm completion zsh >! _helm' \
        atpull'%atclone' src"_helm" run-atpull \
        atload'zpcdreplay'
zplugin light zdharma/null

zplugin ice has'kops' id-as'kops' as"null" wait silent nocompile \
        atclone'kops completion zsh >! _kops' \
        atpull'%atclone' src"_kops" run-atpull \
        atload'zpcdreplay'
zplugin light zdharma/null

zplugin cdreplay -q

# zplugin ice depth=1
# zplugin light romkatv/powerlevel10k
# DEFAULT_USER="rookawa"
# POWERLEVEL9K_MODE='nerdfont-complete'
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=5
# POWERLEVEL9K_SHORTEN_STRATEGY='truncate_from_right'
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir_writable dir vcs pyenv virtualenv aws kubecontext)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator background_jobs history time)

zplugin ice depth=1
zplugin light "denysdovhan/spaceship-prompt"
SPACESHIP_DOCKER_CONTEXT_SHOW=false
SPACESHIP_TIME_SHOW=true

[[ -e $HOME/.localrc ]] && source $HOME/.localrc

path+=("/usr/local/opt/gnu-sed/libexec/gnubin")
path+=("${KREW_ROOT:-$HOME/.krew}/bin")
path+=("/usr/local/opt/postgresql@10/bin")
path+=("/usr/local/sbin")

export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite/include"

export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig /usr/local/opt/sqlite/lib/pkgconfig"

# DISABLE_AUTO_TITLE="true"

# KUBE_PS1_PREFIX=''
# KUBE_PS1_SUFFIX=''

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

export BAT_CONFIG_PATH="$HOME/.bat.conf"

# - Alias
# ls
alias ls='exa'
alias la='exa -la'
alias ll='exa -l'
alias lll='exa -l | less'
alias llt='exa -T'
alias llfu='exa -bghHliS --git'

# cat
alias cat='bat'

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
