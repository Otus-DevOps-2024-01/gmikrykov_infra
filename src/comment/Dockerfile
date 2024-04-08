FROM ruby:2.3-alpine as build

RUN apk --no-cache --update add build-base && \
    gem install bundler -v 2.1
    #--no-ri --no-rdoc

WORKDIR /app
ADD Gemfile* .
RUN bundle install

FROM ruby:2.3-alpine as production
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY . .

ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments

CMD ["puma"]
