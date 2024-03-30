url="https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz"
wget -O maven.tar.gz $url
tar -xvzf maven.tar.gz
settings_file="maven/conf/settings.xml"
if [ ! -f "$settings_file" ]; then
    echo "Maven settings.xml 文件不存在"
    exit 1
fi
new_mirror='
<mirror>
    <id>aliyunmaven</id>
    <mirrorOf>*</mirrorOf>
    <name>阿里云公共仓库</name>
    <url>https://maven.aliyun.com/repository/public</url>
</mirror>'
escaped_mirror=$(printf '%s\n' "$new_mirror" | sed 's:[\&/]:\\&:g;$!s/$/\\/')

sed -i "/<mirrors>/a\\
$escaped_mirror
" "$settings_file"

echo "已成功在 Maven settings.xml 文件中插入阿里云镜像配置"
