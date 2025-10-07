FROM python:3-11-slim

WORKDIR /app

RUN pip install --upgrade pip \
    && pip install fastapi \
    && pip install uvicorn

COPY . .

CMD ['uvicorn', 'main:app','--host'.'0.0.0.0', '--port','6000']