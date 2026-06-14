# ---- Starship (prompt) ----
eval "$(starship init zsh)"

# ---- Plugins (sin Oh My Zsh) ----
source "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# ---- terminal-pretty aliases ----
source "$HOME/.config/terminal-pretty/zshrc-aliases"

# ---- zoxide (cd inteligente) - lazy load ----
z() { unset -f z; eval "$(zoxide init zsh)"; z "$@"; }

# ---- atuin (historial sincronizado) - lazy load ----
atuin() { unset -f atuin; eval "$(atuin init zsh)"; atuin "$@"; }

# ---- thefuck (corrige comandos) - lazy load ----
fuck() { unset -f fuck; eval "$(thefuck --alias)"; fuck "$@"; }

export PATH="$HOME/.local/bin:$PATH"
alias ff="fastfetch --pipe false"
fastfetch --pipe false
