#!/usr/bin/env bash
# brew upgrade tmux eza fzf bpytop translate-shell ripgrep fnm bat jq starship imagemagick jesseduffield/lazygit/lazygit

# Install Ubuntu - Todas las herramientas instaladas en la nueva instalación

# Instalación de Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Actualización de repositorios
sudo apt update
sudo apt upgrade

# Herramientas esenciales del sistema
sudo apt install -y git stow zsh
sudo add-apt-repository -y universe
sudo apt install -y libfuse2

# Herramientas de desarrollo y productividad con Brew
brew install tmux eza fzf bpytop translate-shell ripgrep fnm bat jq starship imagemagick jesseduffield/lazygit/lazygit

# Navegador web
# Google Chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/chrome-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list'
sudo apt update
sudo apt install -y google-chrome-stable

# Git PPA para versión más reciente
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt update
sudo apt install git

#copyq
sudo apt install copyq

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Claude CLI
curl -fsSL https://claude.ai/install.sh | bash

# Node.js (usando fnm)
fnm install 24.11.1
fnm use 24.11.1
fnm default 24.11.1

# Docker y Docker Compose
# Instalar dependencias
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

# Añadir clave GPG oficial de Docker
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.asc >/dev/null
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Añadir repositorio de Docker
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

# Instalar Docker
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Añadir usuario al grupo docker
sudo groupadd docker
sudo usermod -aG docker $USER

# DDEV (herramienta de desarrollo web)
curl -fsSL https://pkg.ddev.com/apt/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/ddev.gpg >/dev/null
sudo chmod a+r /etc/apt/keyrings/ddev.gpg
echo "deb [signed-by=/etc/apt/keyrings/ddev.gpg] https://pkg.ddev.com/apt/ * *" | sudo tee /etc/apt/sources.list.d/ddev.list >/dev/null
sudo apt-get update && sudo apt-get install -y ddev

# Herramientas adicionales
sudo apt install -y flameshot gnome-shell-extension-manager gdebi

# Instalación de paquetes .deb descargados manualmente
# Ulauncher - launcher de aplicaciones
wget https://github.com/Ulauncher/Ulauncher/releases/download/5.15.15/ulauncher_5.15.15_all.deb
sudo gdebi ulauncher_5.15.15_all.deb
rm ulauncher_5.15.15_all.deb

# AutoKey - automatización del escritorio
wget https://github.com/autokey/autokey/releases/download/v0.96.0/autokey-gtk_0.96.0_all.deb
sudo gdebi autokey-gtk_0.96.0_all.deb
wget https://github.com/autokey/autokey/releases/download/v0.96.0/autokey-common_0.96.0_all.deb
sudo gdebi autokey-common_0.96.0_all.deb
rm autokey-gtk_0.96.0_all.deb autokey-common_0.96.0_all.deb

# Discord - chat de voz y texto
wget https://discord.com/api/download?platform=linux &
format=deb -O discord.deb
sudo gdebi discord.deb
rm discord.deb

# Plugins de Oh My Zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# TPM (Plugin Manager para Tmux)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "✅ Instalación completada. Todas las herramientas han sido instaladas."
echo "🔧 Nota: Cierra y abre la terminal para aplicar los cambios de grupo Docker."
