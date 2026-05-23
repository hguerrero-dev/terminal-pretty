# terminal-pretty

Un solo comando para tener la terminal bonita: `ls` con iconos, `apt` con barras de progreso, descargas con ETA y colores en todo.

## Incluye

| Herramienta | Para qué |
|-------------|----------|
| [eza](https://github.com/eza-community/eza) | `ls`, `ll`, `tree` con iconos Nerd Font |
| [nala](https://gitlab.com/volian/nala) | `apt` con barras de progreso y colores |
| [pv](http://www.ivarch.com/programs/pv.shtml) | Progreso + velocidad + ETA en pipes |
| [progress](https://github.com/Xfennec/progress) | Monitorear `cp`, `mv`, `dd` en ejecución |

## Quick start

```bash
git clone git@github.com:hguerrero-dev/terminal-pretty.git
cd terminal-pretty
chmod +x install.sh
./install.sh
```

## Vista previa

```
❯ ll
  Descargas         archivo.zip
  Documentos        script.js
  Escritorio        index.php
  Imágenes          foto.png
  Música            cancion.mp3

❯ nala install firefox
  ━━━━━━━━━━━━━━━━━━━━ 100% ⏱ 0:00:02

❯ progress
  [cp] copiando.iso  45.2% (112.5 MiB / 248.7 MiB)
```

## Aliases disponibles

| Comando | Equivale a |
|---------|------------|
| `ll` | `eza -la --icons` |
| `ls` | `eza --icons` |
| `lt` / `tree` | `eza -T` (árbol) |
| `apt` | `nala` |
| `apti` | `nala install` |
| `aptu` | `nala update` |
| `aptug` | `nala upgrade` |
| `curl` | `curl -#` (barra) |
| `wget` | `wget -q --show-progress` |
| `cpv` | `progress -m` |

## Requisitos

- Ubuntu 24.04+ o derivadas
- Zsh + Oh My Zsh
- Una Nerd Font en la terminal (JetBrains Mono ya incluye iconos)
