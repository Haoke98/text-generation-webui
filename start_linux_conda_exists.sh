
# config
INSTALL_DIR="$(pwd)/installer_files"
CONDA_ROOT_PREFIX="/home/soul/miniconda3"
INSTALL_ENV_DIR="$(pwd)/installer_files/env"


# create the installer env
if [ ! -e "$INSTALL_ENV_DIR" ]; then
    "$CONDA_ROOT_PREFIX/bin/conda" create -y -k --prefix "$INSTALL_ENV_DIR" python=3.11
fi

# check if conda environment was actually created
if [ ! -e "$INSTALL_ENV_DIR/bin/python" ]; then
    echo "Conda environment is empty."
    exit
fi

# environment isolation
export PYTHONNOUSERSITE=1
unset PYTHONPATH
unset PYTHONHOME
export CUDA_PATH="$INSTALL_ENV_DIR"
export CUDA_HOME="$CUDA_PATH"

# activate installer env
conda activate "$INSTALL_ENV_DIR"

# setup installer env
python one_click.py $@
