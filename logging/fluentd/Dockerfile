# RUN gem install faraday -v 0.17.4
# RUN gem install excon -v 0.109.0
# FROM fluent/fluentd:v1.16-debian-1
# USER root
# RUN ["fluent-gem", "install", "fluent-plugin-elasticsearch"]
# RUN ["gem", "install", "faraday -v 0.17.4"]
# RUN ["gem", "install", "excon -v 0.109.0"]
# RUN ["gem", "install", "fluent-plugin-elasticsearch", "--no-document", "--version", "5.0.3"]
# USER fluent
# ADD fluent.conf /fluentd/etc
FROM fluent/fluentd:v1.16.0-debian-1.0
USER root
RUN ["gem", "update", "--system"]
#RUN ["gem", "install", "fluent-plugin-elasticsearch", "--no-document", "--version", "5.0.3"]
RUN ["gem", "install", "fluent-plugin-elasticsearch"]
ADD fluent.conf /fluentd/etc
