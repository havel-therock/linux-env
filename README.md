TODO:
* checkout 'xcape' software and try to remap Caps-Lock to a control when pressed with other keys and to behave as Esc when pressed alone


# linux-env
Development environment on Linux, with some of the tools i like.


# Installation
install.sh script will install all the tools from install/ directory that have a prefix install in their name.
If you want to omit some of the tools just change the prefix to not match 'install'

Set background image of terminal with opacity of 20%

# WSL
If on WSL somethinng happens to netowork, and for example git fetch cannot resolve github.com
then fire up a Powershell and enters these commands:
```
$> wsl --shutdown
$> Get-Service LxssManager | Restart-Service
```
Some of the themes in oh-my-zsh use not installed fonts. On WSL you need to
install the font in Windows and select it in the properties of WSL terminal.

# System wide keyboard remaps

* Windows 10 - Sharp Keys app
* Windows 11 - Power Toys app (per user setting)
* ...

1. 'CAPS-LOCK' --> 'CTRL'
2. ...



# LLDB
If lldb has a problem with
ModuleNotFoundError: No module named 'lldb.embedded\_interpreter'
you would need to install additional python package and provide linkage.
```
apt install python3-lldb-14
ln -s /usr/lib/llvm-14/lib/python<INSERT_VERSION>/dist-packages/lldb/* /usr/lib/python3/dist-packages/lldb/
```

# ...
C++ GUI Libraries:
FTXUI <-> TUI (terminal graphics)
fenster <-> minimal graphics
