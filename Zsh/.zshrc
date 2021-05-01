# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=100000
setopt appendhistory
setopt no_beep
bindkey -e
# End of lines configured by zsh-newuser-install

setopt bang_hist hist_fcntl_lock hist_ignore_dups hist_ignore_space \
       hist_lex_words hist_reduce_blanks share_history

### Added by Zplugin's installer
source "${HOME}/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zplugin's installer chunk

zinit ice from"gh-r" as"program" atload'!eval $(starship init zsh)'
zinit light starship/starship

zinit ice wait lucid atload"zicompinit; zicdreplay" blockf
zinit light zsh-users/zsh-completions

zinit ice wait lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

zinit ice wait lucid
zinit light zdharma/history-search-multi-word

zstyle :compinstall filename "${HOME}/.zshrc"
zinit ice wait lucid atinit"zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

export NVM_AUTO_USE=true
zinit ice wait lucid
zinit light lukechilds/zsh-nvm

zinit creinstall -q %HOME/.zfunc

alias ls='ls -G'

# eval "$(starship init zsh)"
