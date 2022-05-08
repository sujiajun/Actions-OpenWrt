#!/bin/sh
# 修改登录IP
#sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# 修改默认wifi名称ssid为H3C-Tx1801-Plus
sed -i 's/ssid=OpenWrt/ssid=H3C-Tx1801-Plus/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
# sed -i "/commit luci/i\uci set luci.main.mediaurlbase=/luci-static/argon" package/default-settings/files/zzz-default-settings

#sed -i /feeds/kenzo/luci-theme-neobird/luasrc/view/themes/neobird/header.htm

# 版本号里显示一个自己的名字（KingKong build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i "s/OpenWrt /KingKong build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/default-settings/files/zzz-default-settings

# 默认开启WiFi
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 切换ramips内核到5.10
# sed -i '/KERNEL_PATCHVER/cKERNEL_PATCHVER:=5.10' target/linux/ramips/Makefile

# 切换ramips内核到5.15
sed -i '/KERNEL_PATCHVER/cKERNEL_PATCHVER:=5.15' target/linux/ramips/Makefile

# 切换ramips内核到5.4
#sed -i '/KERNEL_PATCHVER/cKERNEL_PATCHVER:=5.4' target/linux/ramips/Makefile

# 修正连接数（by ベ七秒鱼ベ）
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

#复制uci-defaults脚本 
mkdir -p files/etc/uci-defaults
cp -f uci-scripts/* files/etc/uci-defaults

#删除自带低版本xray-core
rm -rf feeds/packages/net/xray-core
rm -rf package/feeds/packages/xray-core

#设置WIFI
sed -i 's/OpenWrt/H3C-Tx1801-Plus/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i 's/wireless.default_radio${devidx}.encryption=none/wireless.default_radio${devidx}.encryption=psk-mixed/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i '/encryption/a\set wireless.default_radio${devidx}.key=H3C-Tx1801-Plus' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#删除一些zzz中的脚本
sed -i '/DISTRIB_/d' package/default-settings/files/zzz-default-settings
sed -i '/footer.htm/d' package/default-settings/files/zzz-default-settings
sed -i '/admin_status/d' package/default-settings/files/zzz-default-settings
