
###########################################################################
# ultility functions
###########################################################################
setupEnvVar () {
    local var_name=$1
    local var_val=$2
    echo "export $var_name=$var_val" >> ~/.bashrc
    echo "export $var_name=$var_val" >> /home/ubuntu/.bashrc
    export $var_name=$var_val
}

printMsg (){
    local msg=$1
    local d=$(date);
    echo  "$d: $msg"

}

printHeader () {
    local text=$1
    echo '********************'
    echo "* $text"
    echo '********************'
}

downloadFile () {
    local f=$1
    local name=$2
    if [ -f $f ];
    then
        echo "$f is downloaded"
    else
        echo "Start download $f"
    wget $f -O $name
    fi
}

setupDocker(){
    printHeader 'setupDocker';
    apt-get update
    apt-get install apt-transport-https ca-certificates
    apt-key adv \
       --keyserver hkp://ha.pool.sks-keyservers.net:80 \
       --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    apt-get update
    apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual
    apt-get install docker-engine

    curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    service docker start
}

setup () {
    export LC_CTYPE=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
    setupEnvVar LC_ALL en_US.UTF-8
    setupEnvVar LC_CTYPE en_US.UTF-8
    setupDocker
}

###########################################################################
# Run setup
###########################################################################
setup