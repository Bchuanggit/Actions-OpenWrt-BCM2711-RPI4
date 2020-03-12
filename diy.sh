#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
#开启wifi
sed -i 's/VHT80/VHT40/' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/disabled=1/disabled=0/' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#默认密码为password
sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/' package/base-files/files/etc/shadow
#设置北京时间
sed -i "s/'UTC'/'CST-8'\n                set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate
#解除网易云音乐播放限制
git clone https://github.com/project-openwrt/luci-app-unblockneteasemusic package/luci-app-unblockneteasemusic
#Clash
git clone https://github.com/frainzy1477/luci-app-clash package/luci-app-clash
#修复Clash随OpenWrt官方源码一起编译出现的依赖冲突
sed -i 's/+luci +luci-base //' package/luci-app-clash/Makefile
#关闭http转向https
sed -i 's/option redirect_https\t1/option redirect_https\t0/' package/network/services/uhttpd/files/uhttpd.config
