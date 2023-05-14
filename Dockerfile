FROM python:3.9.2-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /code

COPY Pipfile Pipfile.lock /code/

RUN pip install --no-cache-dir pipenv==2020.11.15 && pipenv install --ignore-pipfile  --system

COPY . /code/

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

EXPOSE 8000