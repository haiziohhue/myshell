#!/bin/bash
#!/bin/bash

# 检查传入的参数是否为 JDK 17 或 JDK 21
if [ "$JDK_VERSION" == "17" ]; then
    JDK_URL="https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.tar.gz"
    JDK_FOLDER="jdk-17"
elif [ "$JDK_VERSION" == "21" ]; then
    JDK_URL="https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.tar.gz"
    JDK_FOLDER="jdk-21"
else
    echo "Unsupported JDK version. Please provide JDK 17 or JDK 21."
    exit 1
fi

# 下载对应版本的 JDK 安装包
wget -O jdk.tar.gz $JDK_URL

# 解压安装包
tar -xvf jdk.tar.gz

# 移动解压后的 JDK 文件夹到 /usr/local 目录
sudo mv $JDK_FOLDER /usr/local/

# 将 JAVA_HOME/bin 目录添加到 PATH 环境变量中
export PATH=$PATH:$JAVA_HOME/bin

echo "export JDK_VERSION=$JDK_VERSION" >> $CONFIG_FILE
echo "export JAVA_HOME=$JAVA_HOME" >> $CONFIG_FILE
# 检查 Java 版本

java -version