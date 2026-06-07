FROM python:3.10-slim

WORKDIR /app

# 1. Copy ONLY dependency files first (for caching)
COPY requirements.txt .

# 2. Install dependencies first (cached layer)
RUN pip install --no-cache-dir -r requirements.txt

# 3. Copy rest of the code
COPY . .

# 4. Install project
RUN pip install -e .[serve]

CMD ["python", "app.py"]
