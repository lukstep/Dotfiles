FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y \
  build-essential \
  zsh \
  git \
  wget \ 
  tmux \ 
  curl

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
RUN chmod u+x nvim.appimage
RUN /nvim.appimage --appimage-extract
RUN ln -s /squashfs-root/AppRun /usr/bin/nvim
