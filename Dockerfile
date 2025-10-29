# CUDA 12.1 + cuDNN8 + Ubuntu 22.04 ベース
FROM nvidia/cuda:12.1.1-cudnn8-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive \
    PATH="/root/.cargo/bin:/root/.local/bin:${PATH}"

# 基本ツール
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates build-essential git \
    && rm -rf /var/lib/apt/lists/*

# uv インストール
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# 動作確認コマンドを設定
CMD ["uv", "--version"]