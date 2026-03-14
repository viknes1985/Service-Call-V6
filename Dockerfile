# Use the official Node.js image
FROM node:20-slim

# Create app directory
WORKDIR /app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Copy app source
COPY . .

# Build TypeScript if necessary (or just run ts-node)
RUN npm install -g ts-node typescript

# Expose the port from your fly.toml
EXPOSE 3000

# Start the server
CMD ["ts-node", "server.ts"]