JDK17="https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.tar.gz"
JDK21="https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.tar.gz"
wget -O jdk.tar.gz $JDK21
tar -xvf jdk.tar.gz
sudo mv jdk /usr/local/
export JAVA_HOME=/usr/local/jdk
export PATH=$PATH:$JAVA_HOME/bin