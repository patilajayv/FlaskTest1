FROM python:3.9-alpine
WORKDIR /app
COPY . /app
RUN pip install requirements.txt
EXPOSE 80
ENV NAME World
CMD ["python", "app.py"]
