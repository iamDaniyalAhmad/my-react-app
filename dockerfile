FROM node:18

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Update npm to the latest version
RUN npm install -g npm@latest

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Expose port (if needed for the app)
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
