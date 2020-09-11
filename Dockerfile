FROM python:3.8
COPY . /web
WORKDIR /web
RUN pip install --upgrade pip\
    && pip install poetry\
    && poetry install 
CMD ["poetry", "run", "pelican", "-l", "-p", "7000", "-b", "0.0.0.0"]
