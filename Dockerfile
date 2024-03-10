FROM python:3.9-alpine
WORKDIR /app
COPY . /app
EXPOSE 80
ENV NAME World
CMD ["python", "app.py"]
