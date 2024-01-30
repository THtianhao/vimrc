#!/bin/zsh

cd $HOME/project/stable-diffusion-webui

pid=$(pgrep -f 'bash webui.sh --listen')

if [ -n "$pid" ]; then
    echo "找到进程ID：$pid"
    # 使用kill命令终止进程
    kill "$pid"
    echo "进程已终止"
else
    echo "没有找到带有的进程"
fi
cda
conda activate sd
nohup bash webui.sh --listen --api --no-half --port 9999>> ./log &
tail -f log

