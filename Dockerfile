FROM node:20-slim

WORKDIR /app

COPY package*.json ./
# Install everything including typescript
RUN npm install

COPY . .

# Compile TypeScript to JavaScript
RUN npx tsc server.ts --outDir dist --esModuleInterop --skipLibCheck

# Expose port 3000
EXPOSE 3000

# Run the compiled JAVASCRIPT file instead of the .ts file
CMD ["node", "dist/server.js"]