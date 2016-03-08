FROM ruby:2.3.0

RUN gem install bundler

WORKDIR /app

ADD Gemfile Gemfile.lock /app/

RUN bundle install --retry 3 --jobs 4

ADD . /app/

ENTRYPOINT ["/app/bin/freshbooks-time-to-harvest"]
