From debian:jessie
MAINTAINER monsieurchico <rderocle@gmail.com>

# update system
RUN echo "update system"
RUN apt-get update -y --fix-missing
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y

# install required dependencies
#RUN echo "install required dependencies"
RUN apt-get install -y openssl
RUN apt-get install -y  curl \
                        wget

# install and configure git
RUN apt-get install -y git
ADD res/.gitconfig /.gitconfig

RUN mkdir /root/.ssh/
ADD ./res/id_rsa /root/.ssh/id_rsa
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

# install twgit
RUN echo "install twgit"
RUN git clone git@github.com:Twenga/twgit.git /root/twgit
RUN ln -s /root/twgit/twgit /usr/local/bin/twgit
ADD ./res/twgit.sh /root/twgit/conf/twgit.sh

# check install
RUN echo "finish"
CMD twgit
