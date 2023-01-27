FROM debian:latest

WORKDIR /opt
RUN apt-get update && \
    apt install -y git python3-pip neofetch libzbar-dev && \
    git clone https://github.com/TeamPGM/PagerMaid-Pyro.git pagermaid

WORKDIR /opt/pagermaid
RUN pip3 install -r requirements.txt && \
    echo "$pysession" > pagermaid.session
COPY config.yml ./
RUN sed -i "s#ID_HERE#$appid#g" config.yml && \
    sed -i "s#HASH_HERE#$apphash#g" config.yml;

CMD ["python3", "-m", "pagermaid"]