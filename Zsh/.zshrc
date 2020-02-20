# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=100000
setopt appendhistory
setopt no_beep
bindkey -e
# End of lines configured by zsh-newuser-install

### Added by Zplugin's installer
source "${HOME}/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

urlencode() {
    setopt localoptions extendedglob
    input=( ${(s::)1} )
    esc=${(j::)input/(#b)([^A-Za-z0-9_.\!~*\'\(\)-\/])/%${(l:2::0:)$(([##16]#match))}}
    print ${esc// /%20}
}

function precmd () {
    local URL_PATH="$(urlencode ${PWD})"
    [[ $? != 0 ]] && return 1
    printf '\e]7;%s\a' "file://${HOST}${URL_PATH}"
}

zplugin ice wait"0" blockf
zplugin light zsh-users/zsh-completions

zplugin ice wait"0" atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

# zplugin ice wait"0"
# zplugin load agkozak/agkozak-zsh-prompt
# AGKOZAK_MULTILINE=0
# AGKOZAK_CUSTOM_SYMBOLS=( '⇣⇡' '⇣' '⇡' '+' 'x' '!' '>' '?' )

zplugin ice wait"0"
zplugin light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

zstyle :compinstall filename "${HOME}/.zshrc"
zplugin ice wait"2" atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

alias ls='ls -G'

eval "$(starship init zsh)"
