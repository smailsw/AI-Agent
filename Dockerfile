# Base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the entire project
COPY . .

# Set environment variable to specify the service
ARG SERVICE
ENV SERVICE=${SERVICE}

# Command to run the appropriate service
CMD ["sh", "-c", "python ${SERVICE}/app/__init__.py"]