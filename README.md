# linux-env
Development environment on Linux

# System wide keyboard remaps

* Windows 10 - Sharp Keys app
* Windows 11 - Power Toys app (per user setting)
* ...

1. 'CAPS-LOCK' --> 'CTRL'
2. ...

# utils
```
sudo apt install wget
```

# python3
```
sudo apt install python3
```

# neovim
```
sudo apt install neovim
cd
mkdir -p .config/nvim/
```
Put init.lua (nvim config into .config/nvim/ directory.


# zsh
Install zsh
```
sudo apt install zsh
```

set it as a default shell.
```
chsh -s /bin/zsh
```

Then we should install Oh-My-Zsh
```
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

Some of the themes in oh-my-zsh use not installed fonts. 
remember that on WSL you need to install the font in Windows and select it in the properties of WSL window.

# tmux
```
sudo apt install tmux
```
Put tmux.conf into $HOME/.config/tmux/ directory


# C++
```
sudo apt install clang g++ gcc clang-format
```
Move .clang-format to $HOME directory

# ...
