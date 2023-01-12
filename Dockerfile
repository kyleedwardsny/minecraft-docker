FROM ubuntu:22.04

# Expose Minecraft port
EXPOSE 25565

# Install Java
RUN apt-get update && \
  apt-get dist-upgrade -y && \
  apt-get install -y \
    openjdk-17-jre \
    dialog \
    screen

# Create Minecraft user
RUN useradd -m -s /bin/bash minecraft

# Install script
COPY mcdocker /usr/local/bin

# Switch to Minecraft user
USER minecraft
WORKDIR /home/minecraft

# Run script
CMD /usr/local/bin/mcdocker /home/minecraft/mcdocker.cfg
