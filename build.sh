#!/usr/bin/env bash

echo "cleaning up"

rm -vrf build-dir/linux/{amd64,arm64,arm,armv6}

mkdir -p build-dir/linux/{amd64,arm64,arm,armv6}

#Download latest version of Rustdesk-server
LATEST=$(curl https://api.github.com/repos/prometheus/blackbox_exporter/releases/latest -s | grep "tag_name"| awk '{print substr($2, 2, length($2)-3) }')

wget "https://github.com/prometheus/blackbox_exporter/releases/download/${LATEST}/blackbox_exporter-$( echo -n ${LATEST}|sed -e"s@^v@@g").linux-amd64.tar.gz" -O "build-dir/linux/amd64/blackbox_exporter-linux-amd64.tar.gz"
cd build-dir/linux/amd64/ && tar xvf "blackbox_exporter-linux-amd64.tar.gz" && cd -
chmod +x build-dir/linux/amd64/blackbox_exporter-*.linux-amd64/blackbox_exporter
mv -v build-dir/linux/amd64/blackbox_exporter-*.linux-amd64/blackbox_exporter build-dir/linux/amd64/

wget "https://github.com/prometheus/blackbox_exporter/releases/download/${LATEST}/blackbox_exporter-$( echo -n ${LATEST}|sed -e"s@^v@@g").linux-arm64.tar.gz" -O "build-dir/linux/arm64/blackbox_exporter-linux-arm64.tar.gz"
cd build-dir/linux/arm64/ && tar xvf "blackbox_exporter-linux-arm64.tar.gz" && cd -
chmod +x build-dir/linux/arm64/blackbox_exporter-*.linux-arm64/blackbox_exporter
mv -v build-dir/linux/arm64/blackbox_exporter-*.linux-arm64/blackbox_exporter build-dir/linux/arm64/

wget "https://github.com/prometheus/blackbox_exporter/releases/download/${LATEST}/blackbox_exporter-$( echo -n ${LATEST}|sed -e"s@^v@@g").linux-armv7.tar.gz" -O "build-dir/linux/arm/blackbox_exporter-linux-armv7.tar.gz"
cd build-dir/linux/arm/ && tar xvf "blackbox_exporter-linux-armv7.tar.gz" && cd -
chmod +x build-dir/linux/arm/blackbox_exporter-*.linux-armv7/blackbox_exporter
mv -v build-dir/linux/arm/blackbox_exporter-*.linux-armv7/blackbox_exporter build-dir/linux/arm/

wget "https://github.com/prometheus/blackbox_exporter/releases/download/${LATEST}/blackbox_exporter-$( echo -n ${LATEST}|sed -e"s@^v@@g").linux-armv6.tar.gz" -O "build-dir/linux/armv6/blackbox_exporter-linux-armv6.tar.gz"
cd build-dir/linux/armv6/ && tar xvf "blackbox_exporter-linux-armv6.tar.gz" && cd -
chmod +x build-dir/linux/armv6/blackbox_exporter-*.linux-armv6/blackbox_exporter
mv -v build-dir/linux/armv6/blackbox_exporter-*.linux-armv6/blackbox_exporter build-dir/linux/armv6/



echo "Downloaded blackbox-exporter files"
