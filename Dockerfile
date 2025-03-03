FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV APP_HOME /app
ENV TRANSFORMERS_CACHE /tmp/huggingface_cache
ENV LOG_DIR /tmp/logs
ENV PYTHONPATH=$APP_HOME

# Set work directory
WORKDIR $APP_HOME

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Install FastAPI and uvicorn (if not already in requirements.txt)
RUN pip install --no-cache-dir fastapi uvicorn

# Copy the cosmicforge_ai_chatbot directory
COPY cosmicforge_ai_chatbot $APP_HOME/cosmicforge_ai_chatbot

# Create __init__.py file if it doesn't exist
RUN touch $APP_HOME/cosmicforge_ai_chatbot/__init__.py

# Create necessary directories and set permissions
RUN mkdir -p $TRANSFORMERS_CACHE $LOG_DIR $APP_HOME/cosmicforge_ai_chatbot/data \
    && chmod 777 $TRANSFORMERS_CACHE $LOG_DIR $APP_HOME/cosmicforge_ai_chatbot/data

# Clear and recreate Hugging Face cache directory
RUN rm -rf /root/.cache/huggingface \
    && mkdir -p /root/.cache/huggingface && chmod 777 /root/.cache/huggingface

# Set ownership of the application files
RUN chown -R nobody:nogroup $APP_HOME

# Switch to non-root user
USER nobody

# Expose port 7860 for the FastAPI application
EXPOSE 7860

# Command to run the FastAPI application using uvicorn
CMD ["uvicorn", "cosmicforge_ai_chatbot.main:app", "--host", "0.0.0.0", "--port", "7860"]
