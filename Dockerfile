# 1. Use a modern Node.js base image
FROM node:20-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy package files and install all dependencies
# We need typescript and ts-node during the build phase
COPY package*.json ./
RUN npm install

# 4. Copy the rest of your application code
COPY . .

# 5. Compile TypeScript to JavaScript
# The flags --module esnext and --target esnext fix the 'import.meta' error
RUN npx tsc server.ts --outDir dist --esModuleInterop --skipLibCheck --module esnext --target esnext

# 6. Fly.io needs to know which port to listen on
EXPOSE 3000

# 7. Start the server using the compiled JavaScript file
# We use dist/server.js because tsc puts the output in the 'dist' folder
CMD ["node", "dist/server.js"]