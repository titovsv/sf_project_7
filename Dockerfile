FROM python:3-slim-bullseye

WORKDIR /srv/app

COPY ./app .

RUN apt-get update -y \
    && apt-get -y install libpq-dev gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "web.py"]
