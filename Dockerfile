FROM node:8

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install
RUN npm audit fix


# Bundle app source
COPY . /usr/src/app
# install dependencies
RUN npm i

EXPOSE 3000
CMD ["npm", "start"]

