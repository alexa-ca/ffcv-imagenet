#!/bin/bash

IMAGENET_DIR=/home/DATA/ImageNet_raw

# should be on local disk or high performance /scratch
WRITE_DIR=/home/SSD/ffcv_imagenet

# Serialize images with:
# - 500px side length maximum
# - 50% JPEG encoded
# - quality=90 JPEGs
resolution=500
compression=0.50
jpeg_quality=90

write_dataset () {
    write_path=$WRITE_DIR/${1}_${2}_${3}_${4}.ffcv
    echo "Writing ImageNet ${1} dataset to ${write_path}"
    python write_imagenet.py \
        --cfg.dataset=imagenet \
        --cfg.split=${1} \
        --cfg.data_dir=$IMAGENET_DIR/${1} \
        --cfg.write_path=$write_path \
        --cfg.max_resolution=${2} \
        --cfg.write_mode=proportion \
        --cfg.compress_probability=${3} \
        --cfg.jpeg_quality=$4
}

write_dataset train $resolution $compression $jpeg_quality
write_dataset val $resolution $compression $jpeg_quality
