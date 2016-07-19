FROM jupyter/datascience-notebook

MAINTAINER Yohei Naruse <yohei.naruse@bizreach.co.jp>

USER $NB_USER

RUN pip install jupyterlab

RUN jupyter serverextension enable --py jupyterlab

CMD jupyter lab
