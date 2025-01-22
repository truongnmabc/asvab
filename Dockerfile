# Use the official Node.js 22 image as the base image
FROM node:22-alpine

# Set the working directory
WORKDIR /app

# Copy the build output from the GitHub Actions workflow
COPY build_output/.next ./.next
COPY build_output/public ./public
COPY package*.json ./

# Install only production dependencies
RUN yarn install --frozen-lockfile

# Expose the port the app runs on
EXPOSE 3000

# Start the Next.js application
CMD ["npm", "start"]
