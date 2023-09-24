# Use an official Node.js runtime as the base image for the build stage
FROM node:14 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json to the container
COPY package*.json ./

# Install application dependencies
RUN npm install --production

# Copy your application code into the container
COPY . .

# Use a smaller base image for the final production image
FROM node:14-alpine AS production

# Set the working directory in the container
WORKDIR /app

# Copy only the production-ready artifacts (including node_modules)
COPY --from=builder /app .

# Expose port 7000 for the Node.js application
EXPOSE 7000

# Start the Node.js application
CMD ["node", "server.js"]
