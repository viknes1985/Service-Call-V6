# 1. Use a modern Node.js base image
FROM node:20-slim

# 2. Set the working directory
WORKDIR /app

# 3. Copy package files and install all dependencies
COPY package*.json ./
RUN npm install

# 4. Copy the rest of your application code
COPY . .

# 5. Compile TypeScript to JavaScript
# We added --moduleResolution node to help it find mongoose, axios, etc.
RUN npx tsc server.ts --outDir dist \
    --esModuleInterop \
    --skipLibCheck \
    --module esnext \
    --target esnext \
    --moduleResolution node \
    --allowJs

# 6. Expose port 3000
EXPOSE 3000

# 7. Start the server using the compiled JavaScript file
CMD ["node", "dist/server.js"]