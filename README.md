# terminal-pretty

Pack completo para tener una terminal bonita, rápida y productiva en Ubuntu.

## Incluye

### 📁 Navegación
| Herramienta | Para qué |
|-------------|----------|
| [eza](https://github.com/eza-community/eza) | `ls` con iconos Nerd Font, colores, directorios primero |
| [fzf](https://github.com/junegunn/fzf) | Buscador fuzzy — `Ctrl+T` archivos, `Ctrl+R` historial |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | `cd` inteligente — `z doc` te lleva a Documentos desde cualquier lado |
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | Sugiere comandos mientras escribes (como fish) |
| [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) | Colorea comandos mientras tipeas |

### 🔍 Búsqueda y reemplazo
| Herramienta | Para qué |
|-------------|----------|
| [ripgrep (rg)](https://github.com/BurntSushi/ripgrep) | `grep` 10x más rápido |
| [fd](https://github.com/sharkdp/fd) | `find` más rápido y bonito |
| [tealdeer (tldr)](https://github.com/dbrgn/tealdeer) | Ejemplos prácticos de comandos |

### 🐙 Git
| Herramienta | Para qué |
|-------------|----------|
| [delta](https://github.com/dandavison/delta) | `git diff` con colores y syntax highlighting |
| [lazygit](https://github.com/jesseduffield/lazygit) | TUI interactiva para git |

### 📦 Sistema
| Herramienta | Para qué |
|-------------|----------|
| [nala](https://gitlab.com/volian/nala) | `apt` con barras de progreso y colores |
| [bat](https://github.com/sharkdp/bat) | `cat` con syntax highlighting |
| [pv](http://www.ivarch.com/programs/pv.shtml) | Progreso + velocidad + ETA en pipes |
| [progress](https://github.com/Xfennec/progress) | Monitorear `cp`, `mv`, `dd` en ejecución |
| [httpie](https://httpie.io/) | `curl` con colores y JSON formateado |
| [doggo](https://github.com/mr-karan/doggo) | `dig` moderno con colores |

### 🖥️ Terminal multiplexer
| Herramienta | Para qué |
|-------------|----------|
| [tmux](https://github.com/tmux/tmux) | Divide la terminal en paneles, sesiones persistentes |

### 󰇄 File manager
| Herramienta | Para qué |
|-------------|----------|
| [yazi](https://github.com/sxyazi/yazi) | Navegador de archivos en terminal con vim keys, previews |

### 🚀 Productivity
| Herramienta | Para qué |
|-------------|----------|
| [gh](https://cli.github.com/) | GitHub CLI — crear repos, PRs, issues |
| [atuin](https://github.com/atuinsh/atuin) | Historial con búsqueda fuzzy, sincronizado entre máquinas |
| [starship](https://starship.rs/) | Prompt minimalista, rápido, portable |
| [thefuck](https://github.com/nvbn/thefuck) | Corrige comandos automágicamente |
| [trash-cli](https://github.com/andreafrancia/trash-cli) | `rm` que mueve a la papelera |
| [procs](https://github.com/dalance/procs) | `ps` moderno con colores y búsqueda |
| [bandwhich](https://github.com/imsnif/bandwhich) | Monitoreo de red en tiempo real |
| [tokei](https://github.com/XAMPPRocky/tokei) | Contar líneas de código por lenguaje |
| [hyperfine](https://github.com/sharkdp/hyperfine) | Benchmarkear comandos |
| [zsh-abbr](https://github.com/olets/zsh-abbr) | Aliases que se expanden al escribir |

## Vista previa

```
❯ ll
  Descargas         archivo.zip
  Documentos        script.js
  Escritorio        index.php

❯ rg "function" src/ -n
 src/main.js:12:function hello() { ... }

❯ z doc          # te lleva a ~/Documentos
❯ tldr tar       # ejemplos rapidos
❯ lazygit        # TUI interactiva
```

## Quick start

```bash
git clone git@github.com:hguerrero-dev/terminal-pretty.git
cd terminal-pretty
chmod +x install.sh
./install.sh
```

## Aliases disponibles

| Comando | Equivale a |
|---------|------------|
| `ll` / `ls` | `eza` con iconos |
| `lt` / `tree` | `eza -T` (árbol) |
| `apt` | `nala` |
| `cat` | `batcat` |
| `fd` | `fdfind` |
| `rg` | `ripgrep` |
| `df` | `df -h` |
| `free` | `free -h` |
| `ip` | `ip -c` |
| `cpv` | `progress -m` |
| `wget` | `wget -q --show-progress` |
| `curlp` | `curl -o` |
| `http` | `http --pretty=all` |
| `dig` | `doggo` |
| `tmux` | `tmux -2` |
| `tnew` | `tmux new -s` |
| `ta` | `tmux attach -t` |

## Post-instalación

1. Abre una nueva terminal
2. Empieza a escribir un comando y ve las sugerencias
3. `Ctrl+T` para buscar archivos con fzf
4. `Ctrl+R` para buscar en el historial
5. `z do` y presiona Tab para ver opciones de zoxide
6. `lazygit` para git visual

## Uso básico de cada herramienta

### 🖥️ tmux

```bash
tnew proyecto         # Crear sesión persistente
Ctrl+b d              # Desconectarse (la sesión sigue activa)
ta                    # Re-conectarse a la sesión
tls                   # Listar sesiones
```

### 󰇄 yazi

```bash
yazi                  # Abrir navegador
j/k                   # Navegar arriba/abajo
l                     # Entrar a carpeta
h                     # Volver atrás
q                     # Salir
```

### 🌐 httpie

```bash
http https://api.github.com/users/hguerrero-dev
http POST https://httpbin.org/post name="test" value=42
http -h https://example.com
```

### doggo

```bash
dig google.com
dig google.com MX
dig google.com @8.8.8.8
```

### gh

```bash
gh repo create mi-repo --public
gh pr create
gh issue list
gh repo view hguerrero-dev/terminal-pretty --web
```

### atuin

```bash
atuin search nala              # Buscar en historial
atuin search --after "2024-01-01" nala
atuin login && atuin sync      # Sincronizar entre máquinas
```

### 🚀 starship

```bash
# Ya configurado con ~/.config/starship.toml
# Si quieres activarlo en vez de p10k, comenta ZSH_THEME en .zshrc
# y descomenta: eval "$(starship init zsh)"
```

### 🤦 thefuck

```bash
sl                    # Escribiste mal "ls"
fuck                  # Corrige automáticamente → ejecuta "ls"
apt install htop      # Ups, no es sudo
fuck                  # → sudo apt install htop
```

### 🗑️ trash-cli

```bash
rm archivo.zip        # En vez de borrar, mueve a la papelera
trash-list            # Listar archivos en la papelera
trash-restore         # Restaurar interactivamente
trash-empty           # Vaciar papelera
```

### 🧠 procs

```bash
procs                 # Lista procesos con colores
procs nala            # Buscar procesos por nombre
procs --tree          # Vista jerárquica
```

### 📡 bandwhich

```bash
bandwhich             # Mostrar uso de red en tiempo real
bandwhich -n wlo1     # Monitorear interfaz específica
```

### 📊 tokei

```bash
tokei .               # Contar líneas de código en el directorio actual
tokei src/            # Solo en src/
tokei --types rust    # Solo Rust
```

### ⏱️ hyperfine

```bash
hyperfine 'rg "foo" src/' 'grep -r "foo" src/'
# Compara velocidad de rg vs grep

hyperfine 'ls' --warmup 3
# Benchmark con 3 ejecuciones de calentamiento
```

## Requisitos

- Ubuntu 24.04+ o derivadas
- Zsh + Oh My Zsh
- Nerd Font en la terminal (JetBrains Mono)
