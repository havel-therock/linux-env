FROM ubuntu:latest

# root actions
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Warsaw
ARG MY_USER=kszatan

RUN apt-get update -y && apt-get install -y git sudo apt-utils && apt-get upgrade -y
RUN useradd -mg users -G sudo,adm,plugdev ${MY_USER}
RUN echo "${MY_USER}:${MY_USER}" | chpasswd


WORKDIR /home/${MY_USER}/workspace/linux-env

COPY scripts/install_utils.sh scripts/
COPY packages/ packages/
RUN scripts/install_utils.sh "apt-get install -y" .


# RUN chown -R ${MY_USER}: /home/${MY_USER}

COPY . .

# user actions
ARG CACHETRIGGER=3
RUN su -c "workspace/linux-env/scripts/create_symlinks.sh /home/${MY_USER}/workspace/linux-env" - ${MY_USER}
# RUN linux-env/install2.sh --oh-my-zsh --symlinks # --all

RUN chown -R ${MY_USER}: /home/${MY_USER}

WORKDIR /home/${MY_USER}

RUN su -c 'sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended' - ${MY_USER}

RUN sed -i "s|^.*ZSH_CUSTOM=.*$|ZSH_CUSTOM=/home/${MY_USER}/workspace/linux-env/shell-settings|" /home/${MY_USER}/.zshrc

USER kszatan
CMD ["/bin/sh", "-c", "/bin/zsh"]
