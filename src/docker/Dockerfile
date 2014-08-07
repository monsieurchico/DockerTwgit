From debian:jessie
MAINTAINER monsieurchico <rderocle@gmail.com>

# update system
RUN echo "update system"
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y

# install required dependencies
RUN echo "install required dependencies"
RUN apt-get install -y  curl \
                        wget \
                        php5-cli \
                        git

# install phpunit
RUN echo "install phpunit"
RUN wget https://phar.phpunit.de/phpunit.phar
RUN chmod +x phpunit.phar
RUN mv phpunit.phar /usr/local/bin/phpunit

# install twgit
RUN echo "install twgit"
RUN git clone git@github.com:Twenga/twgit.git
RUN ln -s /root/twgit/twgit /usr/local/bin/twgit

# check install
RUN echo "finish"
CMD twgit
