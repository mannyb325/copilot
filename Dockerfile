# Sample Dockerfile for demonstration purposes
# This Dockerfile creates a simple web server using Python's built-in http.server

FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy application code
COPY app.py .

# Expose port
EXPOSE 8080

# Run the application
CMD ["python", "app.py"]