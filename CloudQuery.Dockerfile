FROM node:16-bullseye
WORKDIR /app

# Copy and download dependencies
COPY package*.json /app/
RUN npm install --force
RUN npm install -g npm-run-all

# Bundle app
COPY . .

# Run
CMD [ "run-p", "sb", "sf" ]
