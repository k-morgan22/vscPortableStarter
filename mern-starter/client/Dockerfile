FROM node:14-alpine

RUN apk add --update bash && rm -rf /var/cache/apk/*

# Create App Directory
WORKDIR /app

# Install Dependencies
COPY package.json yarn.lock ./

RUN yarn install

# Copy app source code
COPY . .

# Expose ports
EXPOSE 3000

CMD ["yarn","start"]