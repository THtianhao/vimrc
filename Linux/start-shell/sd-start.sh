#!/bin/zsh

cd $HOME/project/stable-diffusion-webui

pid=$(pgrep -f 'python -B webui.py --listen')

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
nohup python -B webui.py --listen --port 9999>> ./log &
tail -f log

