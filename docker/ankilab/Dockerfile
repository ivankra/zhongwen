# Jupyterlab container for work on anki decks

FROM docker.io/jupyter/scipy-notebook:latest

USER root

RUN apt-get update -y && \
    apt-get dist-upgrade -y && \
    apt-get install -y --no-install-recommends \
        ffmpeg \
        opencc \
	rar \
	p7zip-full

RUN pip install --quiet --no-cache-dir \
        anki \
        genanki \
        opencc \
        python-pptx
