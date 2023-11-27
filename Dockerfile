FROM ubuntu:22.04

MAINTAINER pow3rr3d

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    unzip \
    wget \
    curl \
    gnupg \
    --no-install-recommends

# Install packages
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    php8.2-mysql php8.2-zip php8.2-xml php8.2-mbstring php8.2-curl php8.2-pdo php8.2-tokenizer php8.2-cli php8.2-imap php8.2-intl php8.2-gd php8.2-xdebug php8.2-soap php8.2-apcu \
    apache2 libapache2-mod-php8.2 \
    --no-install-recommends && \
    apt-get clean -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/lib/mysql/ib_logfile* && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \

COPY --from=composer /usr/bin/composer /usr/local/bin/composer