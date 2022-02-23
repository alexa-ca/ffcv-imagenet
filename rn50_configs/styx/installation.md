## FFCV

### Installation

```
conda create -y python=3.8  \
      cupy pkg-config libjpeg-turbo opencv \
      pytorch torchvision  cudatoolkit=11.1.1 \
      numba  compilers hdf5  \
      openmpi libconfig nvidia-apex \
      -c pytorch -c conda-forge \
      --prefix $HOME/conda_env/pytorch-io-py3.8

conda activate $HOME/conda_env/pytorch-io-py3.8
pip install ffcv
conda install -c pytorch -c conda-forge  torchmetrics
```