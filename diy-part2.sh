#!/bin/sh
# 修改登录IP
# sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# 修改主机名
# echo '修改机器名称'
# sed -i 's/OpenWrt/OpenWrt/g' package/base-files/files/bin/config_generate

# 修改默认wifi名称ssid为H3C-Tx1801-Plus
sed -i 's/ssid=OpenWrt/ssid=H3C-Tx1801-Plus/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i "/commit luci/i\uci set luci.main.mediaurlbase='/luci-static/argonne'" package/lean/default-settings/files/zzz-default-settings

#sed -i /feeds/kenzo/luci-theme-neobird/luasrc/view/themes/neobird/header.htm

# 版本号里显示一个自己的名字（KingKong build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i "s/OpenWrt /KingKong build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# 默认开启WiFi
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 切换ramips内核到5.10
# sed -i '/KERNEL_PATCHVER/cKERNEL_PATCHVER:=5.10' target/linux/ramips/Makefile

# 切换ramips内核到5.15
# sed -i '/KERNEL_PATCHVER/cKERNEL_PATCHVER:=5.15' target/linux/ramips/Makefile

# 切换ramips内核到5.4
sed -i '/KERNEL_PATCHVER/cKERNEL_PATCHVER:=5.4' target/linux/ramips/Makefile

# 修正连接数（by ベ七秒鱼ベ）
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

# sirpdboy
#git clone https://github.com/sirpdboy/sirpdboy-package.git package/sirpdboy-package
git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
git clone https://github.com/sirpdboy/luci-app-advanced.git package/luci-app-advanced
git clone https://github.com/sirpdboy/netspeedtest.git package/netspeedtest
git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata
git clone https://github.com/sirpdboy/luci-app-poweroffdevice.git package/luci-app-poweroffdevice
git clone https://github.com/sirpdboy/luci-app-autotimeset.git package/luci-app-autotimeset

# themes添加（svn co 命令意思：指定版本如https://github）
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
git clone https://github.com/openwrt-develop/luci-theme-atmaterial.git package/luci-theme-atmaterial
git clone https://github.com/kiddin9/luci-app-dnsfilter.git package/luci-app-dnsfilter
git clone https://github.com/sujiajun/luci-theme-neobird.git package/luci-theme-neobird

git clone https://github.com/kenzok78/luci-theme-argonne.git
#git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages
#git clone https://github.com/kiddin9/openwrt-packages.git package/openwrt-packages

# 添加额外软件包
git clone https://github.com/Ausaci/luci-app-nat6-helper.git package/luci-app-nat6-helper
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome
git clone https://github.com/vernesong/OpenClash.git package/OpenClash
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
git clone https://github.com/zzsj0928/luci-app-pushbot.git package/luci-app-pushbot
git clone https://github.com/riverscn/openwrt-iptvhelper.git package/openwrt-iptvhelper
#git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus

# 添加smartdns
git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns
