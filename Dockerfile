ARG BASE_CONTAINER=tacosdedatos/tacos-en-jupyter:5cdfc5967bee
FROM $BASE_CONTAINER

LABEL maintainer="chekos <sergio@cimarron.io>"

## ejecuta algun archivo install.R que encontremos
USER root
RUN wget "https://gist.githubusercontent.com/ziadoz/3e8ab7e944d02fe872c3454d17af31a5/raw/ff10e54f562c83672f0b1958a144c4b72c070158/install.sh" -O ./install.sh
RUN chmod +x ./install.sh
RUN ./install.sh

USER $NB_UID
RUN conda install -c conda-forge selenium
