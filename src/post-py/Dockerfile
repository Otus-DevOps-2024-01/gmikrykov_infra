FROM python:3.6.0-slim
COPY sources.list /etc/apt/
WORKDIR /app
ADD . /app

RUN apt-get update && \
    apt-get install -y build-essential &&\
    pip install -r /app/requirements.txt

ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts
EXPOSE 5000

CMD ["python3", "post_app.py"]
