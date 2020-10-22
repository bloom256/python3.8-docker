FROM ubuntu:20.04
ENV TZ=UTC
ENV DEBIAN_FRONTEND=noninteractive

# Dependencies for glvnd and X11.
RUN apt-get update \
  && apt-get install -y -qq --no-install-recommends \
    git-gui \
    gitk \
    htop \
    libegl1 \
    libgl1 \
    libglvnd0 \
    libglx0 \
    libopenmpi3 \
    libx11-6 \
    libxext6 \
    mc \
    openssl \
    python3 \
    python3-pip \
    sudo \
  && rm -rf /var/lib/apt/lists/*

# Env vars for the nvidia-container-runtime.
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute

RUN useradd -m -s /bin/bash -G sudo -p `openssl passwd -1 docker` docker
USER docker

RUN export PATH="$PATH:/home/docker/.local/bin"
RUN echo 'export PATH="$PATH:/home/docker/.local/bin"' >> /home/docker/.bashrc

RUN pip3 install jupyter
EXPOSE 8888

RUN pip3 install --user pipenv
