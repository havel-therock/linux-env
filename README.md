# linux-env
Development environment on Linux

Set background image of terminal with opacity of 15%

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
sudo apt install clang g++ gcc clang-format cmake lldb
```
Move .clang-format to $HOME directory

# LLDB
If lldb has a problem with
ModuleNotFoundError: No module named 'lldb.embedded_interpreter'
you would need to install additional python package and provide linkage.
```
apt install python3-lldb-14
ln -s /usr/lib/llvm-14/lib/python<eg. version 3.10>/dist-packages/lldb/* /usr/lib/python3/dist-packages/lldb/
```

# ...
