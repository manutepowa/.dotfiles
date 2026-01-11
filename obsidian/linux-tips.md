---
title: Linux Tips and Tricks
tags:
  - linux
  - chrome
  - nvim
  - stow
  - tips
  - appimage
aliases: []
id: linux-tips
---

# Linux Tips and Tricks

# Chrome with darkmode by linux settings
```sh
# search this on google to see how to do
google-chrome-stable --enable-features=WebUIDarkMode --force-dark-mode
```

# Stow
- En el caso de notes, no debe de existir el destino "notes" entonces lo crea y lo enlaza sin crear un subdirectorio

# Nvim desde appimage (la versión que quieras)
- Descargar la release que quieras desde: https://github.com/neovim/neovim/releases
```sh
# Dar permiso de ejecución
chmod +x nvim-linux-x86_64.appimage

sudo mkdir /opt/nvim

# Mover a opt (crear carpeta nvim)
sudo mv nvim-linux-x86_64.appimage /opt/nvim

sudo rm -rf /usr/local/bin/nvim

# Enlace simbólico y funcionando
sudo ln -s /opt/nvim/nvim-linux-x86_64.appimage /usr/local/bin/nvim
```

# Xremap
Descargar el zip para x11 (no para gnome) --> xremap-linux-x86_64-x11.zip
darle chmod u+x al ejecutable
Copiarlo a /usr/local/bin porque si está en el PATH, ya está disponible para el sistema
```sh
sudo cp xremap /usr/local/bin/
```
- Luego hacer el stow del dotfiles

## Añadir grupos y regla udev
sudo groupadd -f uinput
sudo usermod -aG uinput $USER
sudo usermod -aG input $USER
echo 'KERNEL=="uinput", GROUP="uinput", MODE="0660", OPTIONS+="static_node=uinput"' | sudo tee /etc/udev/rules.d/99-uinput.rules

REINICIAR PARA QUE LOS GRUPOS FUNCIONEN SIN SUDO

## Añadir autostart
```sh
touch ~/.config/autostart/xremap.desktop


[Desktop Entry]
Type=Application
Name=xremap
Exec=xremap /home/manuel/.config/xremap/config.yml
Icon=input-keyboard
Terminal=false
X-GNOME-Autostart-enabled=true
Comment=Reasignación de teclas al iniciar sesión
```

## Ver las clases que tienen las aplicaciones para xremap por si queremos añadir nuevos keymap
```sh
xprop WM_CLASS
```

