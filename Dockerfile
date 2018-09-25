FROM node:8

# Add Google Chrome to aptitude's (package manager) sources
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | tee -a /etc/apt/sources.list
# Fetch Chrome's PGP keys for secure installation
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
# Update aptitude's package sources
RUN apt-get -qq update -y
# Install latest Chrome stable, Xvfb packages
RUN apt-get -qq install -y google-chrome-stable xvfb gtk2-engines-pixbuf xfonts-cyrillic xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable imagemagick x11-apps default-jre
# Export display for Chrome
#RUN export DISPLAY=:99
# Install Angular CLI exclusively
RUN npm install -g @angular/cli
# INstall docker
RUN curl -sSL https://get.docker.com/ | sh

VOLUME /var/lib/docker
CMD ["dind", "docker", "daemon"]
