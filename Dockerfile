FROM python:3.9-alpine as build
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Testing stage
FROM build as test
WORKDIR /app
COPY . .
RUN python test_app.py

# Runtime stage
FROM python:3.9-alpine
WORKDIR /app
COPY --from=builder /app /app
COPY . .
EXPOSE 5000
CMD ["python", "app.py"]
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
EXPOSE 80
ENV NAME World
CMD ["python", "app.py"]
