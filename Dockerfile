
FROM python:3.9-slim

WORKDIR /app

# ✅ FIX: install C compiler + build tools
RUN apt-get update && apt-get install -y \
    gcc \
    build-essential \
    libev-dev \
    libffi-dev \
    python3-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY . /app

# upgrade pip first (important for ML packages)
RUN pip install --upgrade pip

RUN pip install -e .[serve]

EXPOSE 5000 8000

CMD ["bash"]
