source ~/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

fpath=(/usr/local/share/zsh-completions $fpath)

zplugin light zdharma/zui
zplugin light zdharma/zplugin-crasis

zplugin load zdharma/history-search-multi-word

zplugin ice wait"5" atinit"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" lucid
zplugin light zdharma/fast-syntax-highlighting

zplugin light zsh-users/zsh-autosuggestions
zplugin light zsh-users/zsh-completions
zplugin light zsh-users/zsh-history-substring-search

zplugin ice from"gh-r" as"program"
zplugin light junegunn/fzf-bin

zplugin ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh"
zplugin light direnv/direnv

zplugin snippet https://github.com/rupa/z/blob/master/z.sh

zplugin ice depth"1" pick"lib/{clipboard,compfix,completion,correction,diagnostics,directories,functions,git,grep,history,key-bindings,misc,termsupport,theme-and-appearance}.zsh"
zplugin load robbyrussell/oh-my-zsh

zplugin ice depth"1" multisrc="plugins/{asdf,aws,brew,command-not-found,common-aliases,emoji,encode64,git,httpie,iterm2,kops,kube-ps1,kubectl,minikube,pip,pyenv,python,rsync,ssh-agent,terraform,virtualenv}" pick"/dev/null"
zplugin load robbyrussell/oh-my-zsh

zplugin snippet https://github.com/ahmetb/kubectl-aliases/blob/master/.kubectl_aliases

zplugin ice as"completion"
zplugin snippet https://github.com/docker/compose/blob/master/contrib/completion/zsh/_docker-compose

zplugin ice as"completion"
zplugin snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

zplugin light romkatv/powerlevel10k

[[ -e $HOME/.localrc ]] && source $HOME/.localrc

DEFAULT_USER="rookawa"
DISABLE_AUTO_TITLE="true"

KUBE_PS1_PREFIX=''
KUBE_PS1_SUFFIX=''

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=5
POWERLEVEL9K_SHORTEN_STRATEGY='truncate_from_right'

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir_writable dir vcs pyenv virtualenv aws kubecontext)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator background_jobs history time)

zpcompinit

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash