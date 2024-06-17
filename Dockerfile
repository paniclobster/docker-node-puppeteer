# Base image
FROM node:22.3.0-bullseye

# Upgrade base image
RUN apt-get update \
  && apt-get upgrade --assume-yes \
  && rm -rf /var/lib/apt/lists/*

# Install base dependencies
RUN apt-get update \
  && apt-get install --assume-yes \
    gnupg \
    wget \
  && rm -rf /var/lib/apt/lists/*

# Install dependencies
RUN wget --quiet --output-document - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
  && apt-get update \
  && apt-get install --assume-yes \
    fonts-freefont-ttf \
    fonts-ipafont-gothic \
    fonts-kacst \
    fonts-thai-tlwg \
    fonts-wqy-zenhei \
    google-chrome-stable \
    libxss1 \
  && rm /etc/apt/sources.list.d/google.list \
  && apt-get purge --assume-yes \
    google-chrome-stable \
  && rm -rf /var/lib/apt/lists/*
