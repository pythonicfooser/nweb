FROM fooser/poetry:3.8
COPY . /web
WORKDIR /web
RUN poetry install\
    && poetry run pelican content
CMD ["poetry", "run", "pelican", "-l", "-p", "7000", "-b", "0.0.0.0"]
