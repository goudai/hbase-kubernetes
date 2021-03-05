#!/bin/bash
docker login --username=247687009@qq.com -p QT0jRZFlJ5sAzytgwRONuV599mhBMj registry.cn-shanghai.aliyuncs.com
IMAGE_BASE_URL=registry.cn-shanghai.aliyuncs.com/qingmuio IMAGE_TAG=3.2.2 make