#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=========================================="
echo " terminal-pretty"
echo " Pack completo: eza + nala + fzf + zoxide"
echo " + ripgrep + fd + delta + lazygit + ..."
echo "=========================================="

# ---- Git config global ----
if [ -z "$(git config --global user.name 2>/dev/null)" ]; then
    echo ">>> Configurando git global..."
    git config --global user.name "hguerrero-dev"
    git config --global user.email "hguerrero.dev@proton.me"
fi

# ---- Funcion auxiliar para instalar ----
install_pkg() {
    if ! command -v "$1" &>/dev/null; then
        echo ">>> Instalando $1..."
        sudo apt install -y "$2"
    fi
}

# ---- Actualizar indices ----
sudo apt update

# ---- 📁 eza (ls con iconos) ----
install_pkg eza eza
mkdir -p "$HOME/.config/eza"
cp "$SCRIPT_DIR/eza-config.yml" "$HOME/.config/eza/config.yml"

# ---- 📦 nala (apt con barras de progreso) ----
install_pkg nala nala

# ---- 📊 pv (Pipe Viewer) ----
install_pkg pv pv

# ---- progress (Coreutils Progress Viewer) ----
install_pkg progress progress

# ---- bat (cat con syntax highlighting) ----
install_pkg batcat bat

# ---- 🔍 fzf (buscador fuzzy) ----
install_pkg fzf fzf
# Activar key bindings y auto-completion para zsh (si no se activaron solos)
if [ ! -f "$HOME/.fzf.zsh" ]; then
    /usr/share/fzf/install --key-bindings --completion --no-update-rc 2>/dev/null || true
fi

# ---- zoxide (cd inteligente) ----
install_pkg zoxide zoxide

# ---- ripgrep (grep ultra rapido) ----
install_pkg rg ripgrep

# ---- fd (find rapido) ----
install_pkg fdfind fd-find

# ---- tealdeer (tldr rapido en Rust) ----
install_pkg tldr tealdeer

# ---- delta (git diff con colores) ----
install_pkg delta git-delta
# Configurar delta como pager de git
git config --global core.pager "delta"
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.side-by-side true
git config --global delta.line-numbers true

# ---- lazygit (TUI para git) ----
install_pkg lazygit lazygit

# ---- docker group (permisos sin sudo) ----
if command -v docker &>/dev/null && ! groups "$USER" | grep -q docker; then
    echo ">>> Agregando $USER al grupo docker..."
    sudo usermod -aG docker "$USER"
    echo "⚠️  Cierra sesion y vuelve a entrar para aplicar cambios de grupo docker."
fi

# ---- lazydocker (TUI para docker) ----
if ! command -v lazydocker &>/dev/null; then
    echo ">>> Instalando lazydocker..."
    LAZYVER=$(curl -s https://api.github.com/repos/jesseduffield/lazydocker/releases/latest | grep tag_name | cut -d'"' -f4)
    wget -qO /tmp/lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/download/${LAZYVER}/lazydocker_${LAZYVER#v}_Linux_x86_64.tar.gz"
    tar xzf /tmp/lazydocker.tar.gz -C /tmp
    sudo mv /tmp/lazydocker /usr/local/bin/
    rm -f /tmp/lazydocker /tmp/lazydocker.tar.gz
fi

# ---- 🖥️ tmux (terminal multiplexer) ----
install_pkg tmux tmux

# ---- 🌐 httpie (curl con colores) ----
install_pkg http httpie

# ---- gh (GitHub CLI) ----
install_pkg gh gh

# ---- 🐚 atuin (historial sincronizado) ----
install_pkg atuin atuin

# ---- 󰇄 yazi (file manager en terminal) ----
if ! command -v yazi &>/dev/null; then
    echo ">>> Instalando yazi..."
    YAZI_VER=$(curl -s https://api.github.com/repos/sxyazi/yazi/releases/latest | grep tag_name | cut -d'"' -f4)
    wget -qO /tmp/yazi.zip "https://github.com/sxyazi/yazi/releases/download/${YAZI_VER}/yazi-x86_64-unknown-linux-gnu.zip"
    unzip -qo /tmp/yazi.zip -d /tmp/yazi 2>/dev/null
    sudo cp /tmp/yazi/yazi-x86_64-unknown-linux-gnu/yazi /usr/local/bin/
    sudo cp /tmp/yazi/yazi-x86_64-unknown-linux-gnu/ya /usr/local/bin/
    rm -rf /tmp/yazi /tmp/yazi.zip
fi

# ---- doggo (dig moderno con colores) ----
if ! command -v doggo &>/dev/null; then
    echo ">>> Instalando doggo..."
    DOGGO_VER=$(curl -s https://api.github.com/repos/mr-karan/doggo/releases/latest | grep tag_name | cut -d'"' -f4)
    wget -qO /tmp/doggo.tar.gz "https://github.com/mr-karan/doggo/releases/download/${DOGGO_VER}/doggo_${DOGGO_VER#v}_linux_amd64.tar.gz"
    tar xzf /tmp/doggo.tar.gz -C /tmp
    sudo cp /tmp/doggo /usr/local/bin/
    rm -f /tmp/doggo /tmp/doggo.tar.gz
fi

# ---- 🚀 starship (prompt minimalista) ----
install_pkg starship starship

# ---- 🤦 thefuck (corrige comandos) ----
install_pkg fuck thefuck

# ---- 🗑️ trash-cli (rm seguro) ----
install_pkg trash trash-cli

# ---- 🧠 procs (ps moderno) ----
install_pkg procs procs

# ---- 📊 tokei (contar lineas de codigo) ----
install_pkg tokei tokei

# ---- ⏱️ hyperfine (benchmark de comandos) ----
install_pkg hyperfine hyperfine

# ---- 📡 bandwhich (monitoreo de red) ----
if ! command -v bandwhich &>/dev/null; then
    echo ">>> Instalando bandwhich..."
    which cargo &>/dev/null || sudo apt install -y cargo
    cargo install bandwhich 2>/dev/null || true
fi

# ---- ⚡ zsh-abbr (aliases que se expanden) ----
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-abbr" ]; then
    echo ">>> Instalando zsh-abbr..."
    git clone --depth=1 https://github.com/olets/zsh-abbr "$ZSH_CUSTOM/plugins/zsh-abbr"
fi

# ---- Zsh plugins (autosuggestions + syntax-highlighting) ----
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
mkdir -p "$ZSH_CUSTOM/plugins"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo ">>> Instalando zsh-autosuggestions..."
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo ">>> Instalando zsh-syntax-highlighting..."
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# ---- Copiar .zshrc completo ----
echo ">>> Copiando .zshrc..."
cp "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"

# ---- Copiar aliases a ~/.config/terminal-pretty/ ----
mkdir -p "$HOME/.config/terminal-pretty"
cp "$SCRIPT_DIR/.zshrc-aliases" "$HOME/.config/terminal-pretty/zshrc-aliases"

# ---- Copiar starship config ----
mkdir -p "$HOME/.config"
cp "$SCRIPT_DIR/starship.toml" "$HOME/.config/starship.toml"

echo ""
echo "=========================================="
echo " Instalacion completada."
echo "=========================================="
echo ""
echo "📁 Navegacion:"
echo "   ll / ls / lt / tree  - eza con iconos"
echo "   fzf                  - Ctrl+T (buscar archivos)"
echo "                       - Ctrl+R (historial)"
echo "   z <dir>              - cd inteligente con zoxide"
echo ""
echo "🔍 Busqueda:"
echo "   rg <patron>          - grep ultra rapido"
echo "   fd <nombre>          - find ultra rapido"
echo "   tldr <comando>       - ejemplos rapidos de uso"
echo ""
echo "🐙 Git:"
echo "   lazygit              - TUI interactiva para git"
echo "   git diff             - con delta (colores + side-by-side)"
echo "   gh                   - GitHub CLI (crear repos, PRs, issues)"
echo ""
echo "🖥️ Terminal multiplexer:"
echo "   tmux                 - paneles y sesiones persistentes"
echo "   tnew <name>          - crear nueva sesion tmux"
echo "   ta                   - adjuntarse a sesion tmux"
echo ""
echo "📦 Sistema:"
echo "   nala install <pkg>   - apt con barras de progreso"
echo "   progress             - monitorear cp/mv en ejecucion"
echo "   cat                  - con syntax highlighting"
echo ""
echo "󰇄 Archivos:"
echo "   yazi                 - navegador de archivos en terminal"
echo "   (navega con vim keys, preview de codigo/imagenes)"
echo ""
echo "🌐 Red:"
echo "   http <url>           - curl con colores y JSON formateado"
echo "   dig <dominio>        - doggo, version moderna con colores"
echo ""
echo "🎨 Prompt:"
echo "   starship             - prompt minimalista rapido (opcional)"
echo "   autosuggestions      - zsh sugiere comandos al escribir"
echo "   syntax-highlighting  - colorea comandos mientras tipeas"
echo ""
echo "🗑️ Calidad de vida:"
echo "   fuck                 - corrige comandos (escribe 'fuck' despues de un error)"
echo "   rm                   - trash-cli: mueve a papelera en vez de borrar"
echo "   zsh-abbr             - aliases que se expanden al escribir"
echo ""
echo "📊 Monitoreo:"
echo "   procs                - ps moderno con colores y busqueda"
echo "   bandwhich            - ver que proceso consume internet"
echo ""
echo "🧠 Dev:"
echo "   tokei                - contar lineas de codigo por lenguaje"
echo "   hyperfine            - benchmarkear comandos"
echo "   atuin                - historial con busqueda fuzzy"
echo "                       - sincronizado entre maquinas"
echo ""
echo "🐋 Docker:"
echo "   lazydocker           - TUI interactiva para docker"
echo "   d / dc / dcu / dcd   - atajos para docker y compose"
echo "   lzd                  - alias de lazydocker"
echo ""
echo "Abre una nueva terminal para aplicar todo."
echo ""
