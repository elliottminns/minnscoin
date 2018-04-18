FROM ubuntu:16.04
COPY ./minnscoin.conf /root/.minnscoin/minnscoin.conf
COPY . /minnscoin
WORKDIR /minnscoin
RUN chmod +x ./install.sh
RUN ./install.sh
EXPOSE 85008 85009
CMD ["minnscoind", "--printtoconsole"]
