#! /bin/sh
echo 'starting'
nohup jupyter notebook --no-browser --ip=0.0.0.0 > /home/docker/output.txt
