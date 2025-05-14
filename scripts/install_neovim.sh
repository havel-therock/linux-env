# install neovim
mkdir -p ${HOME}/tools/
cd ${HOME}/tools/

# version for older glibc
# https://github.com/neovim/neovim-releases/releases/download/v0.11.1/nvim-linux-x86_64.tar.gz
wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
