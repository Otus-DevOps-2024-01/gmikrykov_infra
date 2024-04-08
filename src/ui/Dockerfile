FROM ruby:2.3-alpine as build

RUN apk --no-cache --update add build-base && \
    gem install bundler -v 2.1
    #--no-ri --no-rdoc

WORKDIR /app
COPY Gemfile* .
RUN bundle install

FROM ruby:2.3-alpine as production
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY . .

ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]
