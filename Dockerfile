# base image with Ruby
FROM ruby:2.3

# install system packages
RUN apt-get update -qq && \
    apt-get install -y build-essential

# create app directory and set working directory
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# copy app files and install dependencies
ADD raddit-app $APP_HOME/
RUN bundle install

# Run puma command on container's start
CMD ["puma"]


