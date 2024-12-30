FROM ruby:3.0.1-buster

#TimeZone a Tijuana
#ENV TZ=America/Tijuana

WORKDIR /app

RUN curl -sL https://deb.nodesource.com/setup_8.x | sh -

RUN apt-get update -y && apt-get install -y npm

RUN npm install --global yarn

COPY Gemfile* ./

RUN bundle install

COPY . .

RUN rails webpacker:install

#Hacer link al archivo del timezone
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

CMD ["rails", "db:setup"]
