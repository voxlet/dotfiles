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

zinit ice wait blockf
zinit light zsh-users/zsh-completions

zinit ice wait atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zinit ice wait
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

zinit ice wait
zinit light zdharma/history-search-multi-word

zstyle :compinstall filename "${HOME}/.zshrc"
zinit ice wait"1" atinit"zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

export NVM_AUTO_USE=true
zinit ice wait
zinit light lukechilds/zsh-nvm

alias ls='ls -G'

eval "$(starship init zsh)"
