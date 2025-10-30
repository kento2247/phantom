
# Install Hamer
cd submodules/phantom-hamer
aria2c -x10 -s10 -k1M https://www.cs.utexas.edu/~pavlakos/hamer/data/hamer_demo_data.tar.gz
tar --warning=no-unknown-keyword --exclude=".*" -xvf hamer_demo_data.tar.gz
cd ../..

# Download E2FGVI weights
cd submodules/phantom-E2FGVI/E2FGVI/release_model/
gdown --fuzzy https://drive.google.com/file/d/10wGdKSUOie0XmCr8SQ2A2FeDe-mfn5w3/view?usp=sharing
cd ../..
cd ../..

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