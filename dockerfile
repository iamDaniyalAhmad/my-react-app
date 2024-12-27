# Use a Node.js base image
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json for dependency installation
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire project to the container
COPY . .

# Build the React application
RUN npm run build

# Serve the application using a simple static file server
RUN npm install -g serve
CMD ["serve", "-s", "build"]

# Expose port 3000
EXPOSE 3000
