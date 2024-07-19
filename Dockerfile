# Use an official Node runtime as the parent image
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the app and redirect output to a file
RUN npm run build > build_output.log 2>&1

# Display the build output
RUN cat build_output.log

# Install serve to run the application
RUN npm install -g serve

# Expose port 3005
EXPOSE 3005

# Run the app
CMD ["serve", "-s", "build", "-l", "3005"]