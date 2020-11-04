# Base image
FROM ubuntu:18.04

# Update cache
RUN apt-get update

# Install packages
RUN apt-get install -y mongodb-server ruby-full ruby-dev build-essential git
RUN gem install bundler

# Add repo
RUN git clone -b monolith https://github.com/express42/reddit.git

# Copy config file
COPY mongod.conf /etc/mongod.conf
COPY db_config /reddit/db_config
COPY start.sh /start.sh

# Install dependency
RUN cd /reddit && rm Gemfile.lock && bundle install
RUN chmod 0777 /start.sh

# Start services
CMD ["/start.sh"]
