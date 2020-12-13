sudo apt update
# GIT
sudo apt install -y git zsh
git config --global user.name "Alvaro Garcia"
git config --global user.email "maxpowel@gmail.com"

# Fonts
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh Hack
rm -rf nerd-fonts
# at this point you may need to restart to get changes take effect

# zsh stuff
chsh -s `which zsh`
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp zsh/.zshrc $HOME/

# Python
sudo apt install -y python3-pip
sudo -H pip3 install virtualenv

# Docker
sudo apt-get install -y \                                    
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \\n   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \\n   $(lsb_release -cs) \\n   stable"
sudo apt update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER

# Golang
# Maybe update the version
curl https://dl.google.com/go/go1.15.6.linux-amd64.tar.gz --output golang.tar.gz
sudo tar -C /usr/local -xzf golang.tar.gz
rm golang.tar.gz
# go env variables are configured in the zsh

# Nodejs
curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
sudo apt-get install -y nodejs


# Copy my own files
cp zsh/* $HOME


# Kubernetes stuff
sudo snap install microk8s --classic
sudo usermod -a -G microk8s maxpowel
sudo chown -f -R maxpowel ~/.kube
# You may need to relogin again
microk8s status --wait-ready
microk8s enable dashboard dns registry istio ingress
microk8s kubectl get all
microk8s.kubectl config view --raw > $HOME/.kube/config

#k9s
https://github.com/derailed/k9s/releases/download/v0.24.2/k9s_Linux_x86_64.tar.gz

echo "The system is ready! Keep installing other stuff like vscode, pycharm or cura"

# kubectl
sudo snap install kubectl --classic

#kubectx and kubens
wget https://github.com/ahmetb/kubectx/releases/download/v0.9.1/kubectx_v0.9.1_linux_x86_64.tar.gz
wget https://github.com/ahmetb/kubectx/releases/download/v0.9.1/kubens_v0.9.1_linux_x86_64.tar.gz
