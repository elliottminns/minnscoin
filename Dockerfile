FROM ubuntu:16.04
COPY . /minnscoin
WORKDIR /minnscoin
RUN sh install.sh
EXPOSE 85008 85009
CMD ["minnscoind", "--printtoconsole"]
