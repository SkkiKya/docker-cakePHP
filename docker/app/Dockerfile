FROM centos:7

# 各パッケージのアップデート
RUN yum -y update

# zip unzipのインストール
RUN yum -y install zip unzip

# remi リポジトリの追加（remi を入れるには epel も必要）
RUN yum -y install epel-release
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# Apache(httpd), PHP のインストール
RUN yum -y --enablerepo=remi,remi-php74 install \
    httpd \
    php \
    php-cli \
    php-common \
    php-devel \
    php-gd \
    php-mbstring \
    php-mysqli \
    php-mysqlnd \
    php-pecl-apcu \
    php-xml \
    php-xmlrpc \
    php-intl \
    php-pecl-xdebug \
    iproute

# httpd.conf のログを stdout, stderr に繋ぐ
RUN ln -sf /dev/stdout /var/log/httpd/access_log && \
    ln -sf /dev/stderr /var/log/httpd/error_log

# mime タイプのファイル追加
RUN ln -sf /etc/mime.types /etc/httpd/conf/mime.types

#タイムゾーンの設定
RUN ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# PHP 設定ファイル
COPY php.ini /etc/php.ini

# httpd をフォアグラウンドで動かす（コンテナ内で処理が終わらない）
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]