# ---- Starship (prompt) ----
eval "$(starship init zsh)"

# ---- Plugins (sin Oh My Zsh) ----
source "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# ---- Opciones de zsh ----
setopt AUTO_CD

# ---- Completion ----
autoload -Uz compinit && compinit

# ---- Flecha arriba/abajo inteligente (filtra historial) ----
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search

# ---- terminal-pretty aliases ----
source "$HOME/.config/terminal-pretty/zshrc-aliases"

# ---- zoxide (cd inteligente) - lazy load ----
z() { unset -f z; eval "$(zoxide init zsh)"; z "$@"; }

# ---- atuin (historial sincronizado) ----
eval "$(atuin init zsh)"

# ---- thefuck (corrige comandos) ----
eval "$(thefuck --alias)"

export PATH="$HOME/.local/bin:$PATH"

alias ff="fastfetch --pipe false"
fastfetch --pipe false
