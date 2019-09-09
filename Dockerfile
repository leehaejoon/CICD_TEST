FROM ubuntu:18.04

USER root

ENV HOME /root
ENV DEBIAN_FRONTEND=noninteractive
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV TZ Asia/Seoul

RUN apt update && apt install -y --no-install-recommends git \
    emacs vim-tiny curl wget maven sudo cppcheck make build-essential libssl1.0-dev \
    zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev \
    libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl \
    openjdk-8-jdk openjdk-8-jre \
    libgeos-dev libcunit1 libcunit1-doc libcunit1-dev gcc \
    openssh-client openssh-server

RUN git clone git://github.com/yyuu/pyenv.git $HOME/.pyenv
RUN git clone https://github.com/yyuu/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv

RUN pyenv install 3.7.0
RUN pyenv global 3.7.0
RUN pip install -r requirements.txt

COPY . $HOME/
WORKDIR $HOME/
