#/usr/bin/env bash

# 安裝執行檔和 .dat 資料檔
wget -O install-release.sh https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh
# 只更新 .dat 資料檔
wget -O install-dat-release.sh https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-dat-release.sh

chmod +x install-release.sh install-dat-release.sh
