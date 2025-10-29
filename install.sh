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
aria2c -x10 -s10 -k1M https://www.cs.utexas.edu/~pavlakos/hamer/data/hamer_demo_data.tar.gz
tar --warning=no-unknown-keyword --exclude=".*" -xvf hamer_demo_data.tar.gz
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
uv pip install  --no-build-isolation -e .
cd ../..

# Install additional packages
uv pip install joblib mediapy open3d pandas
uv pip install transformers==4.42.4
uv pip install PyOpenGL==3.1.4
uv pip install Rtree
uv pip install git+https://github.com/epic-kitchens/epic-kitchens-100-hand-object-bboxes.git
uv pip install protobuf==3.20.0
uv pip install hydra-core==1.3.2
uv pip install omegaconf==2.3.0

# Download E2FGVI weights
cd submodules/phantom-E2FGVI/E2FGVI/release_model/
uv pip install gdown
gdown --fuzzy https://drive.google.com/file/d/10wGdKSUOie0XmCr8SQ2A2FeDe-mfn5w3/view?usp=sharing
cd ../..

# Install phantom-E2FGVI
uv pip install  --no-build-isolation -e .
cd ../..

# Install phantom 
uv pip install  --no-build-isolation -e .

# Download sample data
mkdir -p data/raw
cd data/raw
aria2c -x10 -s10 -k1M https://download.cs.stanford.edu/juno/phantom/pick_and_place.zip
unzip pick_and_place.zip
rm pick_and_place.zip
aria2c -x10 -s10 -k1M https://download.cs.stanford.edu/juno/phantom/epic.zip
unzip epic.zip
rm epic.zip
cd ../..
