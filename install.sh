# ######################## Phantom Env ###############################
uv venv --python 3.10.0
source .venv/bin/activate
uv pip install -U pip setuptools wheel build

# install torch for cuda 11.8
uv pip install torch==2.1.0 torchvision==0.16.0 torchaudio==2.1.0 --index-url https://download.pytorch.org/whl/cu121

# Install SAM2
cd submodules/sam2
uv pip install  --no-build-isolation -v -e ".[notebooks]"
cd ../..

# Install Hamer
cd submodules/phantom-hamer
uv pip install  --no-build-isolation -e .\[all\]
uv pip install  --no-build-isolation -v -e third-party/ViTPose
cd ../..

# Install mmcv
uv pip install mmcv==1.3.9
uv pip install mmcv-full -f https://download.openmmlab.com/mmcv/dist/cu121/torch2.1/index.html
uv pip install numpy==1.26.4

# Install phantom-robosuite
cd submodules/phantom-robosuite
uv pip install  --no-build-isolation -e .
cd ../..

# Install phantom-robomimic
cd submodules/phantom-robomimic
uv pip install --no-build-isolation -e .
cd ../..

# Install additional packages
uv pip install joblib mediapy open3d pandas transformers==4.42.4 PyOpenGL==3.1.4 Rtree protobuf==3.20.0 hydra-core==1.3.2 omegaconf==2.3.0
uv pip install git+https://github.com/epic-kitchens/epic-kitchens-100-hand-object-bboxes.git

# Install phantom-E2FGVI
cd submodules/phantom-E2FGVI
uv pip install  --no-build-isolation -e .
cd ../..

# Install phantom 
uv pip install  --no-build-isolation -e .

uv pip uninstall opencv-python
uv pip install --no-cache-dir "opencv-python-headless<5.0" pyopengl-accelerate "pyglet<2.0" pyrender==0.1.45 trimesh gdown
uv pip install numpy==1.26.4 "PyOpenGL>=3.1.7"
uv pip install torch==2.1.0 torchvision==0.16.0 torchaudio==2.1.0 --index-url https://download.pytorch.org/whl/cu121
uv pip uninstall transformers
uv pip install --no-cache-dir "transformers==4.42.4"
uv pip install h5py