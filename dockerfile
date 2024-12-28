FROM node:18

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Update npm to the latest version
RUN npm install -g npm@10.8.2

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

FROM ubuntu
RUN apt-get update
RUN apt-get install nginx -y
COPY --from=build /app/dist /var/www/html/
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
