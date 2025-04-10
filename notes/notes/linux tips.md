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
chmod +x nvim.appimage

# Mover a opt (crear carpeta nvim)
sudo mv nvim.appimage /opt/nvim
# Enlace simbólico y funcionando
sudo ln -s /opt/nvim/nvim.appimage /usr/local/bin/nvim
```
