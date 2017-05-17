FROM python:3

RUN pip install virtualenv

RUN useradd jupyter
RUN adduser jupyter sudo
RUN mkdir /home/jupyter/

ADD entrypoint.sh /home/jupyter/
RUN chmod +x /home/jupyter/entrypoint.sh
ADD requirements.txt /home/jupyter/
ADD notebooks/ /home/jupyter/notebooks

RUN chown jupyter:jupyter /home/jupyter/

VOLUME ["/home/jupyter/notebooks"]

WORKDIR /home/jupyter

RUN virtualenv myenv && pip install -r /home/jupyter/requirements.txt

ENV SHELL=/bin/bash
ENV USER=jupyter

EXPOSE 8888:8888

ENTRYPOINT ["/bin/bash", "/home/jupyter/entrypoint.sh"]
