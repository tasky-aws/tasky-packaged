tar -xvf tasky-linux-x64.tar.gz
sudo mv tasky /usr/local/bin/tasky-api
sudo mv tasky-linux-x64 ~/tasky-frontend

mkdir -p  ~/.config/systemd/user/

sd 'CHANGEME' '$HOME' $(fd --type file)

sudo mv tasky-api.service ~/.config/systemd/user/
sudo mv tasky.service ~/.config/systemd/user/
systemctl --user enable tasky.service
systemctl --user enable tasky-api.service

systemctl --user start tasky.service
systemctl --user start tasky-api.service

systemctl --user status tasky.service
systemctl --user status tasky-api.service


