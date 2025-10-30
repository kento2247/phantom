# CUDA 12.1 + cuDNN8 + Ubuntu 22.04 ベース
FROM nvidia/cuda:12.1.1-cudnn8-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive \
    HYDRA_FULL_ERROR=1 \
    MUJOCO_GL=egl \
    PYOPENGL_PLATFORM=egl \
    PATH="/root/.cargo/bin:/root/.local/bin:${PATH}"

# 基本ツール（aria2, unzip, OpenGL/OSMesa ライブラリを追加）
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates build-essential git aria2 unzip \
    libegl1 libgles2 libosmesa6 \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1-mesa-glx libgl1-mesa-dri libglu1-mesa \
    libosmesa6 libosmesa6-dev libegl1-mesa-dev libgles2-mesa-dev \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    cmake build-essential ninja-build pkg-config \
    libegl1-mesa-dev libgles2-mesa-dev libx11-dev && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    libgl1 libglu1-mesa libgl1-mesa-glx libegl1 \
    libx11-6 libxext6 libxrender1 freeglut3 libosmesa6

RUN apt-get update && apt-get install -y ffmpeg

# uv インストール
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# 動作確認コマンドを設定
CMD ["uv", "--version"]