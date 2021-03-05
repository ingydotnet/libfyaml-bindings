FROM ubuntu:20.04

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
        build-essential \
        curl \
        git \
        libreadline-dev \
        libyaml-dev \
        liblua5.3-dev \
        lua5.3 \
        python3 \
        python3-venv \
        unzip \
        vim \
        wget \
 && true

RUN python3 -mvenv /venv

ENV PATH=/venv/bin:/here/bin:$PATH

RUN pip install hererocks \
 && hererocks /here --luarocks 3 --lua=5.3 --patch \
 && hererocks tools --luajit=2.0 \
 && luarocks --lua-dir=/tools --tree=/tools install ldoc \
 && luarocks --lua-dir=/tools --tree=/tools install luacov \
 && luarocks install ansicolors \
 && luarocks install specl \
 && true
