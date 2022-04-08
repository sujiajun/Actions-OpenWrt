#!/bin/sh
#修改登录IP
sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate
#修改主机名
sed -i 's/OpenWrt/H3C-Tx1801-Plus/g' package/base-files/files/bin/config_generate

#删除自带低版本xray-core
#rm -rf feeds/packages/net/xray-core
#rm -rf package/feeds/packages/xray-core
# 修改默认wifi名称ssid为H3C-Tx1801-Plus
sed -i 's/ssid=OpenWrt/ssid=H3C-Tx1801-Plus/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#配置ipv6、主题
sed -i '/exit 0/d' package/lean/default-settings/files/zzz-default-settings
cat default-settings/config_smartdns >> package/lean/default-settings/files/zzz-default-settings
cat default-settings/config_ipv6 >> package/lean/default-settings/files/zzz-default-settings
cat default-settings/config_theme >> package/lean/default-settings/files/zzz-default-settings
cat default-settings/config_vssr >> package/lean/default-settings/files/zzz-default-settings
echo "exit 0" >> package/lean/default-settings/files/zzz-default-settings
# 版本号里显示一个自己的名字（KingKong build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i "s/OpenWrt /KingKong build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings
#复制内核5.10版本CPU超频补丁
#\cp -rf preset-models/322-mt7621-fix-cpu-clk-add-clkdev.patch target/linux/ramips/patches-5.10/322-mt7621-fix-cpu-clk-add-clkdev.patch
#设置WIFI
#sed -i 's/OpenWrt/coolxiaomi/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i 's/wireless.default_radio${devidx}.encryption=none/wireless.default_radio${devidx}.encryption=psk-mixed/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i '/encryption/a\set wireless.default_radio${devidx}.key=coolxiaomi' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#修改登录密码为coolxiaomi
#sed -i '/root/croot:$1$CBd7u73H$LvSDVXLBrzpk4JfuuN.Lv1:18676:0:99999:7:::' package/base-files/files/etc/shadow
# Modify WiFi ON
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#切换ramips内核到5.10
#sed -i '/KERNEL_PATCHVER/cKERNEL_PATCHVER:=5.10' target/linux/ramips/Makefile
#切换ramips内核到5.15
#sed -i '/KERNEL_PATCHVER/cKERNEL_PATCHVER:=5.15' target/linux/ramips/Makefile
