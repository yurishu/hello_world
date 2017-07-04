FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
ENV INSTALL_PATH /hello_world
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH
ADD Gemfile* $INSTALL_PATH/
RUN bundle install
RUN test -f $INSTALL_PATH/tmp/pids/server.pid && rf $INSTALL_PATH/tmp/pids/server.pid; true

ADD . $INSTALL_PATH
CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]