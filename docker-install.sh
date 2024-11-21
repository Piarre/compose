
echo -e "\e[34mUninstalling old Docker versions\e[0m"
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
echo -e "\e[34mUpdating repos\e[0m"
sudo apt-get update -y
echo -e "\e[34mInstalling dependencies\e[0m"
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings 
echo -e "\e[34mAdding Docker's official GPG key\e[0m"
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo -e "\e[34mAdding Docker repository to APT sources\e[0m"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo -e "\e[34mUpdating repos\e[0m"
sudo apt-get update -y

# Install Docker
echo -e "\e[34mInstalling Docker\e[0m"
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Check if Docker is installed
echo -e "\e[34mChecking if Docker is installed\e[0m"
if [ $(which docker) ]; then
  echo "Docker installed successfully"
else
  echo "Docker installation failed"
fi