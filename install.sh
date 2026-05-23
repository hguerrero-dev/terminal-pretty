#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=========================================="
echo " terminal-pretty"
echo " Todo en uno: eza + nala + pv + progress"
echo "=========================================="

# ---- Git config global ----
if [ -z "$(git config --global user.name 2>/dev/null)" ]; then
    echo ">>> Configurando git global..."
    git config --global user.name "hguerrero-dev"
    git config --global user.email "hguerrero.dev@proton.me"
fi

# ---- eza (ls moderno con iconos) ----
if ! command -v eza &>/dev/null; then
    echo ">>> Instalando eza..."
    sudo apt update && sudo apt install -y eza
fi
mkdir -p "$HOME/.config/eza"
cp "$SCRIPT_DIR/eza-config.yml" "$HOME/.config/eza/config.yml"

# ---- nala (apt con barras de progreso) ----
if ! command -v nala &>/dev/null; then
    echo ">>> Instalando nala..."
    sudo apt install -y nala
fi

# ---- pv (Pipe Viewer) ----
if ! command -v pv &>/dev/null; then
    echo ">>> Instalando pv..."
    sudo apt install -y pv
fi

# ---- progress (Coreutils Progress Viewer) ----
if ! command -v progress &>/dev/null; then
    echo ">>> Instalando progress..."
    sudo apt install -y progress
fi

# ---- Agregar aliases a .zshrc ----
ALIAS_FILE="$SCRIPT_DIR/.zshrc-aliases"
if [ -f "$ALIAS_FILE" ]; then
    if ! grep -q "source.*zshrc-aliases" "$HOME/.zshrc" 2>/dev/null; then
        echo "" >> "$HOME/.zshrc"
        echo "# ---- terminal-pretty aliases ----" >> "$HOME/.zshrc"
        echo "source \"$ALIAS_FILE\"" >> "$HOME/.zshrc"
    fi
fi

echo ""
echo "=========================================="
echo " Instalacion completada."
echo "=========================================="
echo ""
echo "Resumen de comandos disponibles:"
echo ""
echo "  📁 eza:"
echo "     ll   - Listado detallado con iconos"
echo "     ls   - Listado simple con iconos"
echo "     lt   - Vista de arbol"
echo "     tree - Vista de arbol"
echo ""
echo "  📦 nala:"
echo "     nala install <pkg>  - Instalar con barras de progreso"
echo "     nala update         - Actualizar indices"
echo "     nala upgrade        - Actualizar sistema"
echo "     nala search <pkg>   - Buscar paquetes"
echo ""
echo "  📊 pv + progress:"
echo "     progress            - Ver progreso de cp/mv en ejecucion"
echo "     <cmd> | pv          - Ver progreso en pipes"
echo "     curl -# <url>       - Descarga con barra de progreso"
echo ""
echo "Abre una nueva terminal para aplicar los cambios."
echo ""
