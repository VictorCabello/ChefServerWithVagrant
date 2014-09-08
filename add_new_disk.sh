sudo set -x
sudo init 1
echo -e "n\ne\n1\n\n\nw\n" | sudo fdisk /dev/sdb
echo -e "n\nl\n1\n\n\nw\n" | sudo fdisk /dev/sdb

echo -e "n\ne\n1\n\n\nw\n" | sudo fdisk /dev/sdc
echo -e "n\nl\n1\n\n\nw\n" | sudo fdisk /dev/sdc
sudo mkfs.ext4 /dev/sdb5
sudo mkfs.ext4 /dev/sdc5

sudo mount /dev/sdb5 /media
cd /opt
sudo cp -ax * /media
sudo rm -rf /opt
sudo umount /media

sudo mount /dev/sdc5 /media
cd /var
sudo cp -ax * /media
sudo rm -rf /var
sudo umount /media


echo "/dev/sdb5               /opt                   ext4    defaults        0 0" 
| sudo tee -a /etc/fstab

echo "/dev/sdc5               /var                   ext4    defaults        0 0" 
| sudo tee -a /etc/fstab

sudo mount opt
sudo mount var
