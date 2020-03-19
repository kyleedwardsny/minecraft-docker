FROM ubuntu:18.04

# Expose Minecraft port
EXPOSE 25565

# Install Java
RUN apt-get update && \
  apt-get dist-upgrade -y && \
  apt-get install -y openjdk-8-jre dialog

# Create Minecraft user
RUN useradd -m -s /bin/bash minecraft

# Install script
COPY mcdocker /usr/local/bin

# Switch to Minecraft user
USER minecraft
WORKDIR /home/minecraft

# Run script
CMD /usr/local/bin/mcdocker /home/minecraft/mcdocker.cfg
