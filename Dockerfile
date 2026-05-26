FROM python:3.11-slim

WORKDIR /app

# Copy requirements first (better caching)
COPY requirements.txt /app/requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy bot code
COPY main.py /app/main.py

# Create necessary folders
RUN mkdir -p /app/temp_cookies /app/bot_output /app/bulk_results

# Run the bot
CMD ["python", "/app/main.py"]
