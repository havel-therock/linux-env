# make it priettier and automated
# for now just paste it at the end of .bashrc
LINUX_ENV_DIR=$(HOME)/workspace/linux-env/shell-settings
for file in ${LINUX_ENV_DIR}/*; do source $file; done
