FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN set -ex && apt-get update && apt-get install -y \
    python3=3.8.2-0ubuntu2 \
    python3-pip=20.0.2-5ubuntu1.6 \
    libreoffice=1:6.4.7-0ubuntu0.20.04.2 \
    unoconv=0.7-2 \
    && apt-get clean && rm -rf /var/cache/apt

COPY requirements.txt /app/
RUN pip install -r /app/requirements.txt

COPY ./app/ /app/
RUN  chmod +x /app/app.py

WORKDIR /app
EXPOSE 5000

ENTRYPOINT ["python3", "app.py"]