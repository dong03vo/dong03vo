!/bin/bash
# install software in rocky
#ssh -i ~/.ssh/hiop-key azureuser@52.159.108.155
#
sudo dnf -y install glibc-langpack-en
sudo dnf -y update && \
sudo dnf makecahe --refresh && \
sudo dnf config-manager --set-enabled crb && \
sudo dnf -y install epel-release python-pip

cat > /etc/yum.repos.d/mongodb-org-6.0.repo  <<EOF
[mongodb-org-6.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/6.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-6.0.asc
EOF

sudo dnf -y install mongodb-org
sudo systemctl status mongod
sudo systemctl start mongod
sudo systemctl enable mongod
