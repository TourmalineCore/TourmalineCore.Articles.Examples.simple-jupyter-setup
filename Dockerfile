# Python version that matches the Python version in pyproject.toml
FROM python:3.11.11-slim

ENV PYTHONFAULTHANDLER=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

WORKDIR /workspace

RUN apt-get update \
   # https://packages.debian.org/ru/sid/python3-dev
   && apt-get install -y --no-install-recommends python3-dev \
   && python -m pip install --upgrade pip \
   && pip install poetry==2.1 \
   && pip install ipykernel


COPY pyproject.toml poetry.lock ./

RUN poetry config virtualenvs.create false \
   && poetry install --no-interaction --no-ansi

CMD ["jupyter-lab","--ip=0.0.0.0","--no-browser","--NotebookApp.token=''","--NotebookApp.password=''","--allow-root"]
