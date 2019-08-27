FROM python:3.7-alpine

COPY ./requirements.txt ./
RUN pip install --no-cache -r requirements.txt
COPY app.py ./

ENV FLASK_HOST="0.0.0.0"
ENV FLASK_PORT="5000"

EXPOSE 5000

ENTRYPOINT flask run -h "${FLASK_HOST}" -p "${FLASK_PORT}"
