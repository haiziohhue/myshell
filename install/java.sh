#!/bin/bash

$install_maven $install_gradle $mirror_maven
JDK_URL="https://download.oracle.com/java/${version_java}/latest/jdk-${version_java}_linux-x64_bin.tar.gz"
JDK_FOLDER="jdk-${version_java}"
wget -O jdk.tar.gz $JDK_URL

tar -xvf jdk.tar.gz

sudo mv $JDK_FOLDER /usr/local/

echo "export JDK_VERSION=$JDK_VERSION" >>$CONFIG_FILE
echo "export JAVA_HOME=$JAVA_HOME" >>$CONFIG_FILE
echo "export PATH=$PATH:$JAVA_HOME/bin" >>$CONFIG_FILE
source $CONFIG_FILE

java -version

if "$install_maven"=="y"; then
    url="https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz"
    wget -O maven.tar.gz $url
    tar -xvzf maven.tar.gz -C /opt/maven
    echo 'export PATH=$PATH:/opt/maven/bin' >>$CONFIG_FILE
    if "$mirror_maven"=="y"; then
        settings_file="/opt/maven/conf/settings.xml"
        if [ ! -f "$settings_file" ]; then
            echo "Maven settings.xml no found"
            exit 1
        fi
        new_mirror='
<mirror>
    <id>aliyunmaven</id>
    <mirrorOf>*</mirrorOf>
    <name>Aliyun</name>
    <url>https://maven.aliyun.com/repository/public</url>
</mirror>'
        sed -i "/<mirrors>/a\\
$escaped_mirror
" "$settings_file"
        echo "已成功在 Maven settings.xml 文件中插入阿里云镜像配置"
    fi
fi
if "$install_gradle"=="y"; then
    url="https://downloads.gradle-dn.com/distributions/gradle-7.5.1-bin.zip"
    wget -O gradle.zip $url
    unzip gradle.zip -d /opt/gradle
    echo 'export PATH=$PATH:/opt/gradle/bin' >>$CONFIG_FILE
    source $CONFIG_FILE
fi
