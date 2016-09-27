FROM python:2
ENV PYTHONUNBUFFERRED 1
RUN pip install jupyter

RUN useradd --create-home --home-dir /home/docker --shell /bin/bash docker
RUN adduser docker sudo

ADD start.sh /home/docker/start.sh
RUN chmod +x /home/docker/start.sh
RUN chown docker /home/docker/start.sh

ADD prod_sentiment.ipynb /home/docker/prod_sentiment.ipynb
ADD output.txt /home/docker/output.txt
RUN chmod +x /home/docker/output.txt
RUN chown docker /home/docker/output.txt

EXPOSE 8888
RUN usermod -a -G sudo docker
RUN echo "docker ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER docker

ENV HOME=/home/docker
ENV SHELL=/bin/bash
ENV USER=docker

RUN printenv
CMD ./home/docker/start.sh

