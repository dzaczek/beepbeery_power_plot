sudo apt update
#sudo apt upgrade -y
sudo apt install bc i2c-tools gnuplot dialog -y
sudo sh -c "echo '* *     * * *   root     bash /usr/sbin/batlog.sh' >> /etc/crontab"
sudo cp bat.sh /usr/bin/bat.sh
sudo cp batlog.sh /usr/sbin/batlog.sh
sudo cp batmon.sh /usr/bin/batmon.sh 

