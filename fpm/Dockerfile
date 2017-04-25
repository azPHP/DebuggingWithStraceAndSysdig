FROM fedora:rawhide

RUN dnf -y upgrade && dnf -y install php-cli php-mysqlnd strace vim man nginx php-fpm dumb-init htop procps-ng findutils

RUN echo "colorscheme evening" > /root/.vimrc
RUN echo "[www]" > /etc/php-fpm.d/z-override.conf && \
    echo "listen = 127.0.0.1:9000" >> /etc/php-fpm.d/z-override.conf

COPY ./run-stuff.sh /run-stuff.sh
ENTRYPOINT ["dumb-init"]
CMD ["/run-stuff.sh"]
