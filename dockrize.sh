
DOCKER_IMAGE="jenkins/jenkins:lts"
CONTAINER_NAME="jenkins"
JENKINS_HOME="${HOME}/.jenkins"

if [ ! -d $JENKINS_HOME ]; then
    mkdir -p $JENKINS_HOME
fi

docker run --name $CONTAINER_NAME --detach \
    --privileged --user root \
    --publish 8080:8080 --publish 50000:50000 \
    --volume $JENKINS_HOME:/var/jenkins_home \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume /usr/bin/docker:/usr/bin/docker \
    $DOCKER_IMAGE
