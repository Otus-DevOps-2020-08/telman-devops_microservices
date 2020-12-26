FROM ruby:2.2

RUN apt-get update -yq && apt-get install -y build-essential

WORKDIR /app
ADD Gemfile* /app/
RUN bundle install
COPY . /app/

ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments

CMD ["puma"]
