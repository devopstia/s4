echo "Installing Updates"
sudo apt -y update
sudo apt install -y vim
sudo apt install -y wget
sudo apt install -y tree
sudo apt install -y unzip
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2