set -x
export INPUT_FILE=$1;
export EXP_DIR=$2;
export SUBJECT_NAME=$(basename $1 | cut -d"." -f1);
export REPLICATE_API_TOKEN="r8_EJu1X8jZrc4486xQH0pdXRHNbY9eJYF3vDGnK"; # your replicate token for BLIP API
export CUDA_HOME=/usr/local/cuda-11.6/ #/your/cuda/home/dir;
export PYOPENGL_PLATFORM=osmesa
export MESA_GL_VERSION_OVERRIDE=4.1
export PYTHONPATH=$PYTHONPATH:$(pwd);
_CUDA_VISIBLE_DEVICES=$3

mkdir -p ${EXP_DIR}
mkdir -p ${EXP_DIR}/png/

# # Step 1: Preprocess image, get SMPL-X & normal estimation
CUDA_VISIBLE_DEVICES=$_CUDA_VISIBLE_DEVICES python utils/body_utils/preprocess.py --in_path ${INPUT_FILE} --out_dir ${EXP_DIR}

# sh scripts/run1.sh input/aaa/aaa.png exp/aaa 0