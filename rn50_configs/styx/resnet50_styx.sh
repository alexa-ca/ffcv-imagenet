#!/bin/bash

IMAGENET_DIR=/home/DATA/ImageNet_raw

# should be on local disk or high performance /scratch
WRITE_DIR=/home/SSD/ffcv_imagenet

FFCV_HOME=$HOME/ffcv-imagenet
OUTPUT_DIR=$FFCV_HOME/runs/logs-$(date +%Y-%m-%d-%H-%M-%S)


TRAIN_DATASET=${WRITE_DIR}/train_500_0.50_90.ffcv
VAL_DATASET=${WRITE_DIR}/val_500_0.50_90.ffcv


# 2 GPU training
export CUDA_VISIBLE_DEVICES=0,1

# Set the visible GPUs according to the `world_size` configuration parameter
# Modify `data.in_memory` and `data.num_workers` based on your machine
python train_imagenet.py --config-file ${FFCV_HOME}/meta/resnet50_styx_gtx.yaml \
    --data.train_dataset=${TRAIN_DATASET} \
    --data.val_dataset=${VAL_DATASET} \
    --data.num_workers=12 --data.in_memory=1 \
    --logging.folder=${OUTPUT_DIR}


