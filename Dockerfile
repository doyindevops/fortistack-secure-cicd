# Use the Node.js base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy app files
COPY app/package*.json ./
RUN npm install

COPY app .

# Expose port and start app
EXPOSE 3000
CMD ["node", "server.js"]
