FROM python:3.9-alpine
WORKDIR /app
COPY . /app
RUN apk add --no-cache gcc musl-dev linux-headers && \
    pip install --no-cache-dir -r requirements.txt && \
    apk del gcc musl-dev linux-headers
EXPOSE 80
ENV NAME World
CMD ["python", "app.py"]
