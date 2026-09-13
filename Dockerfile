# Use an official lightweight Python image
FROM node:20-alpine 
 
# Set the working directory
WORKDIR /app

# Copy dependency file and install dependencies
COPY package*.json .

# Install only production dependencies
RUN npm ci --omit=dev || npm install --omit=dev

# Copy application source code
COPY index.js ./

# Expose the default application port
EXPOSE 3000

# Run the app as a non-root user for security
USER node

# Start the application
CMD ["npm", "start"]



# RUN pip install --no-cache-dir -r requirements.txt

# # Copy the application code
# COPY . .

# # Expose Flask default port
# EXPOSE 5000

# # Run the app
# CMD ["python", "hello.py"]
