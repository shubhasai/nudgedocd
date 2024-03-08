# Use Node.js as base image
FROM node:latest

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY tools/site/package*.json ./

# Install dependencies
RUN npm install

# Install gulp globally
RUN npm install -g gulp

# Copy the entire project directory into the container
COPY tools/site/ ./

# Expose the port your app runs on
EXPOSE 8000

# Define the command to run your app
CMD ["gulp", "serve", "--codelabs-dir=codelabs"]