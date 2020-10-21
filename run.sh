docker run -it -d --name python3.8 \
--gpus all \
--env="DISPLAY" \
--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
-e QT_X11_NO_MITSHM=1 \
-v /home/dan/data:/data \
-v /home/dan/src:/src \
python3.8
