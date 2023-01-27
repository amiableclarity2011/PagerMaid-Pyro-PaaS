FROM debian:latest

WORKDIR /opt
RUN apt-get update && \
    apt install -y git python3-pip neofetch libzbar-dev && \
    git clone https://github.com/TeamPGM/PagerMaid-Pyro.git pagermaid

WORKDIR /opt/pagermaid
COPY config.yml ./
COPY init.sh ./
RUN pip3 install -r requirements.txt && \
    bash init.sh

EXPOSE 80
CMD ["python3", "-m", "pagermaid"]