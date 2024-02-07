# linux-env
Development environment on Linux. Clone this repository under the name *.config/*
into the $HOME directory.

Set background image of terminal with opacity of 20%


# WSL
If on WSL somethinng happens to netowork, and for example git fetch cannot resolve github.com
then fire up a Powershell and enters these commands:
```
$> wsl --shutdown
$> Get-Service LxssManager | Restart-Service
```

# System wide keyboard remaps

* Windows 10 - Sharp Keys app
* Windows 11 - Power Toys app (per user setting)
* ...

1. 'CAPS-LOCK' --> 'CTRL'
2. ...


# SetUp
```
sudo apt install git wget python3 neovim zsh tmux clang g++ gcc clang-format cmake lldb clang-tidy
ninja-build gettext unzip curl tree
ripgrep python3-venv npm
```

If any file requires specific location outside .config dir then just create
symlinks with:
```
ln -s -T <TARGET_FILE> <SYM_LINK_FILE>
```
for example:
create symlink from $HOME/.clang-format to \_clang-format inside git.

Set zsh as a default shell.
```
chsh -s /bin/zsh
```

Then install Oh-My-Zsh
```
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

Some of the themes in oh-my-zsh use not installed fonts. On WSL you need to
install the font in Windows and select it in the properties of WSL terminal.


# LLDB
If lldb has a problem with
ModuleNotFoundError: No module named 'lldb.embedded\_interpreter'
you would need to install additional python package and provide linkage.
```
apt install python3-lldb-14
ln -s /usr/lib/llvm-14/lib/python<INSERT_VERSION>/dist-packages/lldb/* /usr/lib/python3/dist-packages/lldb/
```

# ...
