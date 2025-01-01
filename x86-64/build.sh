#!/bin/bash

echo "编译固件大小为: $PROFILE MB"

# 输出调试信息
echo "$(date '+%Y-%m-%d %H:%M:%S') - 开始编译..."



# 定义所需安装的包列表
PACKAGES=""
PACKAGES="$PACKAGES curl"
PACKAGES="$PACKAGES luci-i18n-diskman-zh-cn"     #磁盘管理工具
PACKAGES="$PACKAGES luci-i18n-firewall-zh-cn"    #添加防火墙
PACKAGES="$PACKAGES luci-i18n-filebrowser-zh-cn" #文件浏览器
PACKAGES="$PACKAGES luci-app-argon-config"
PACKAGES="$PACKAGES luci-i18n-argon-config-zh-cn"
PACKAGES="$PACKAGES luci-i18n-opkg-zh-cn"
PACKAGES="$PACKAGES luci-i18n-ttyd-zh-cn"        #网页终端命令行
PACKAGES="$PACKAGES luci-i18n-passwall-zh-cn"
PACKAGES="$PACKAGES luci-i18n-dockerman-zh-cn"   #Dockerman容器
PACKAGES="$PACKAGES luci-i18n-adbyby-plus-zh-cn" #广告屏蔽大师Plus +
PACKAGES="$PACKAGES luci-i18n-alist-zh-cn"       #Alist 文件列表
PACKAGES="$PACKAGES luci-i18n-aria2-zh-cn"       # Aria2下载工具
PACKAGES="$PACKAGES luci-i18n-autoreboot-zh-cn"  #计划重启
PACKAGES="$PACKAGES luci-i18n-ddns-zh-cn"        #动态域名 DNS
PACKAGES="$PACKAGES luci-i18n-hd-idle-zh-cn"     #硬盘休眠
PACKAGES="$PACKAGES luci-i18n-mwan3-zh-cn"       #MWAN3负载均衡
PACKAGES="$PACKAGES luci-i18n-netdata-zh-cn"     #Netdata实时监控
PACKAGES="$PACKAGES luci-i18n-nlbwmon-zh-cn"     #网络带宽监视器
PACKAGES="$PACKAGES luci-app-openclash"
PACKAGES="$PACKAGES luci-i18n-qbittorrent-zh-cn" #BT下载工具
PACKAGES="$PACKAGES luci-app-syncdial"           #多拨虚拟网卡
PACKAGES="$PACKAGES luci-i18n-upnp-zh-cn"        #通用即插即用UPnP（端口自动转发
PACKAGES="$PACKAGES luci-i18n-vlmcsd-zh-cn"      #KMS服务器设置
PACKAGES="$PACKAGES luci-i18n-zerotier-zh-cn"    #ZeroTier内网穿透

# 构建镜像
echo "$(date '+%Y-%m-%d %H:%M:%S') - Building image with the following packages:"
echo "$PACKAGES"

make image PROFILE="generic" PACKAGES="$PACKAGES" FILES="/home/build/immortalwrt/files" ROOTFS_PARTSIZE=$PROFILE

if [ $? -ne 0 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Error: Build failed!"
    exit 1
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') - Build completed successfully."
