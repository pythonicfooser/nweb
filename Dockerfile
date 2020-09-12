FROM fooser/pelican:3.8
COPY . /web
WORKDIR /web
RUN pelican content
CMD ["pelican", "-l", "-p", "7000", "-b", "0.0.0.0"]
