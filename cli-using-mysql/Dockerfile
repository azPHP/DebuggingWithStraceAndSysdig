FROM fedora:25

RUN dnf -y upgrade && dnf -y install php-cli php-mysqlnd strace vim man

RUN echo "colorscheme evening" > /root/.vimrc
ENTRYPOINT ["php"]
CMD ["-h"]