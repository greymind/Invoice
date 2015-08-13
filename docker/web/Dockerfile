FROM ubuntu
MAINTAINER Balakrishnan (Balki) Ranganathan <balki@live.com>

ENV DEBIAN_FRONTEND noninteractive

# Install system packages
RUN apt-get -y update && apt-get install -y \
	python \
	git \
	nodejs \
	npm \
	build-essential

# Install global node packages via npm
RUN npm install -g \
	http-server \
	forever \
	nodemon

# Link node to nodejs
RUN ln -s "$(which nodejs)" /usr/bin/node

# Print node version
RUN node -v

# Set initial working directory
WORKDIR /vagrant

# Launch bash
CMD ["/bin/bash"]