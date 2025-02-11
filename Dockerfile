# This is the Dockerfile for building a development image with Pizzly

# Build image 
FROM node:14-alpine

# Make sure we have ca certs for TLS
RUN apk --no-cache add ca-certificates

WORKDIR /app

# Copy in dependencies for building
COPY . ./

RUN yarn install --frozen-lockfile

RUN yarn build

CMD ["node", "./dist/src/index.js"]
