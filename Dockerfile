FROM node:16-bullseye
WORKDIR /app

# Install Python
RUN apt update -y || : && apt install python -y

# Copy and download dependencies
COPY package*.json /app/
RUN npm install --force
RUN npm install -g npm-run-all

# Install Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \ 
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get -y install google-chrome-stable

# Bundle app
COPY . .

EXPOSE 1234
EXPOSE 3000
EXPOSE 33333
CMD [ "run-p", "sb", "sf" ]
