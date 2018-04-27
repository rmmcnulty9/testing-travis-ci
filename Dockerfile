FROM ros:kinetic

RUN apt-get update && apt-get install -y \
    less \
    vim \
    curl

