FROM debian:12.2

MAINTAINER pow3rr3d

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    unzip \
    wget \
    curl \
    gnupg \
    nodejs npm \
    --no-install-recommends

# Install packages
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git php8.2-mysql php-sqlite3 php8.2-zip php8.2-xml php8.2-mbstring php8.2-curl php8.2-pdo php8.2-tokenizer php8.2-cli php8.2-imap php8.2-intl php8.2-gd php8.2-xdebug php8.2-soap php8.2-apcu sqlite3 libsqlite3-dev ssh\
    apache2 libapache2-mod-php8.2 \
    --no-install-recommends && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer &&\
    apt-get clean -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y

COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN composer --version