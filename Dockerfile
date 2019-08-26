FROM python:3.7-alpine

COPY ./requirements.txt ./
RUN pip install --no-cache -r requirements.txt
COPY app.py ./
EXPOSE 5000

ENV HOST=0.0.0.0
ENV PORT=5000

ENTRYPOINT flask run -h ${HOST} -p ${PORT}
