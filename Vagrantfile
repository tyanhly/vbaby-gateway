Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "private_network", ip: "100.100.100.100"

   config.vm.provision "shell", inline: <<-SHELL
       apt-get install apt-transport-https ca-certificates -y
       apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
       apt-get update -y
       apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual -y
       apt-get install docker docker-compose
       usermod -aG docker $(whoami)
       service docker start
       cd /vagrant
    SHELL
end
