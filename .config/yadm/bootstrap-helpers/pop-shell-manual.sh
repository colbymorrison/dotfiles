#! /bin/bash

if ! cmd_exists tsc; then
	echo -e "${RED}Installing typescript"
	sudo npm install -g typescript
fi

mkdir -p /tmp/pop-shell
pushd /tmp/pop-shell
git clone https://github.com/pop-os/shell

echo -e "${RED}Making Pop! Shell"
if make local-install; then
	echo -e "${RED}Enabling Pop! Shell"
	gnome-extensions enable pop-shell@system76.com
fi

popd
rm -r /tmp/pop-shell

echo -e "${RED}Removing typescript (leaving Node)"
sudo npm uninstall -g typescript
