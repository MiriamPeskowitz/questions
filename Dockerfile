FROM ruby:2.6.3

ENV BUNDLE_PATH="/gems"
ENV BUNDLE_HOME="/gems"
ENV GEM_HOME="/gems"
ENV GEM_PATH="/gems"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

RUN apt-get update -qq && apt-get install -y build-essential wget

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y nodejs

# yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -\
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn

RUN mkdir -p "$GEM_HOME"
RUN mkdir /myapp
WORKDIR /myapp

RUN gem install bundler

COPY Gemfile Gemfile.lock ./
COPY package.json yarn.lock ./

RUN bundle install
RUN yarn install

ADD . /myapp
