FROM python:3

RUN pip install virtualenv

RUN useradd jupyter
RUN adduser jupyter sudo
RUN mkdir /home/jupyter/

ADD entrypoint.sh /home/jupyter/
RUN chmod +x /home/jupyter/entrypoint.sh
ADD notebook/ /home/jupyter

RUN chown jupyter:jupyter /home/jupyter/

WORKDIR /home/jupyter

RUN virtualenv myenv && pip install -r /home/jupyter/requirements.txt

ENV SHELL=/bin/bash
ENV USER=jupyter

EXPOSE 8888:8888

ENTRYPOINT ["/bin/bash", "/home/jupyter/entrypoint.sh"]
