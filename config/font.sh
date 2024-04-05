#!/bin/bash
install_path="/tmp/font-install" 
mkdir -p $install_path
cd $install_path

# 下载Fira Code字体压缩包
wget -O fira-code.zip https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip
wget -O harmony-os-sans.zip https://developer.huawei.com/images/download/general/HarmonyOS-Sans.zip
# 解压缩字体文件
unzip fira-code.zip
unzip harmony-os-sans.zip
# 移动字体文件到系统字体目录
sudo cp *.ttf /usr/share/fonts/

# 刷新系统字体缓存
sudo fc-cache -f -v

# 清理临时文件
rm -rf $install_path

echo "Fira Code和HarmonyOS-Sans字体安装完成！"