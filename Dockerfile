FROM nginx

# Install software
RUN apt-get update && \
    apt-get install -y apt-utils wget curl nano git && \
    apt-get install -y lsb-release apt-transport-https ca-certificates  && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list && \
    apt-get update && \
    apt-get install -y php7.4-fpm && \
    apt-get install -y php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-opcache php7.4-soap php7.4-zip php7.4-intl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    rm -rf /var/www && \
    mkdir /var/www

WORKDIR "/var/www"

RUN git clone https://github.com/devraizer/Cosmic.git . && \
    cd Cosmic && \
    composer update && \
    chmod 777 App && \
    chmod 777 public

EXPOSE 80
EXPOSE 443
