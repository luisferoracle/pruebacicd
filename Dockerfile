FROM python:3.10-alpine

LABEL maintainer="luisferoracle <cainas.luis@outlook.com>"

EXPOSE 5000

ENV FLASK_APP=main.py

RUN apk update \
    && pip install -U pip \
    && mkdir -p /app

WORKDIR /app/

# COPY ./src/requirements.txt /app
COPY ./requirements.txt /app/

RUN pip install -r requirements.txt

COPY ./main.py /app/

CMD ["flask","run", "--host=0.0.0.0" ]