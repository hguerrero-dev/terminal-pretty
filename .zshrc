export ZSH="$HOME/.oh-my-zsh"

# Elige tu prompt: descomenta solo UNO
# ---- Powerlevel10k ----
# ZSH_THEME="powerlevel10k/powerlevel10k"
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ---- Starship (prompt por defecto) ----
eval "$(starship init zsh)"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ---- terminal-pretty aliases ----
source "$HOME/.terminal-pretty/.zshrc-aliases"

# ---- zoxide (cd inteligente) ----
eval "$(zoxide init zsh)"

# ---- atuin (historial sincronizado) ----
eval "$(atuin init zsh)"

# ---- thefuck (corrige comandos) ----
eval "$(thefuck --alias)"

export PATH="$HOME/.local/bin:$PATH"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
fastfetch --pipe false
