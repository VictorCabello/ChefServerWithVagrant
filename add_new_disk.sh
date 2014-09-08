set -x
sudo yum install -y parted
echo -e "n\ne\n1\n\n\nw\n" | sudo fdisk /dev/sdb
sudo partprobe /dev/sdb
echo -e "n\nl\n\n+10G\nw\n" | sudo fdisk /dev/sdb
sudo partprobe /dev/sdb
echo -e "n\nl\n\n+10G\nw\n" | sudo fdisk /dev/sdb
sudo partprobe /dev/sdb

sudo mkfs.ext4 /dev/sdb5
sudo mkfs.ext4 /dev/sdb6

sudo mount /dev/sdb5 /media
cd /opt
sudo cp -ax * /media
sudo mv /opt /opt.back
sudo umount /media

sudo mount /dev/sdb6 /media
cd /var
sudo cp -ax * /media
sudo mv /var /var.back
sudo umount /media


echo "/dev/sdb5               /opt                   ext4    defaults        0 0" | sudo tee -a /etc/fstab

echo "/dev/sdb6               /var                   ext4    defaults        0 0" | sudo tee -a /etc/fstab

sudo mkdir /opt
sudo mkdir /var

sudo mount /opt
sudo mount /var
