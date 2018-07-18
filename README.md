# Dockerfile sample for deep learning

nvidia-docker2を用いた深層学習用のDockerfileのサンプル

## チートシート

### Dockerfile を colne, ディレクトリに移動
```
git clone https://github.com/yush1ga/deeplearning-dockerfile
cd deeplearning-dockerfile
```

### ビルド
```
sudo docker build -t ${image_name} .
```

### 起動
```
sudo nvidia-docker run -itd -v /home/$(whoami):/workspace -p 8888:8888 --name=${container_name} ${image_name} /bin/bash
```

### コンテナに接続
```
sudo docker exec -it ${container_name} env COLUMNS=200 LINES=50 /bin/bash
```

### jupyter起動
```
jupyter lab --port 8888 --ip=0.0.0.0 --no-browser --allow-root --NotebookApp.iopub_data_rate_limit=100000000 &
```

### コンテナ削除
```
sudo docker stop ${container_name}; sudo docker rm ${container_name}
```

### イメージ削除
```
sudo docker rmi ${image_id}
```
