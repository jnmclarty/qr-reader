FROM python:3.11-slim
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdbus-1-3 \
    libxkbcommon0 \
    libgtk-3-0 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libgbm1 \
    libxshmfence1 \
    ffmpeg \
    libsm6 \
    libxext6 \
    libzbar0 \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

COPY . /e2e
WORKDIR /e2e

RUN pip install --upgrade pip && pip install -r requirements.txt && python -m playwright install chromium

CMD ["python", "server.py"]
