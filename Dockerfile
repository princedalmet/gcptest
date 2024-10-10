# Use the node:19.7.0-alpine base image
FROM node:19.7.0-alpine

# Set the environment variable
ENV NODE_ENV=production

# Create a new directory and change ownership
RUN mkdir /labone && chown -R node:node /labone

# Set the working directory
WORKDIR /labone

# Set the user to node
USER node

# Copy all source files and change ownership
COPY --chown=node:node . .

# Install node.js packages
RUN npm install

# Expose port 3000
EXPOSE 3000

# Set the default execution command
CMD ["node", "src/app.js"]
