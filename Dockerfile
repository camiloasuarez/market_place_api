FROM ruby:3.1

# Instala las dependencias necesarias
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client build-essential libssl-dev

WORKDIR /app

# Copia los archivos Gemfile y Gemfile.lock
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Instala las gemas
RUN bundle install

# Instala Rails
RUN gem install rails

# Copia el resto de la aplicación
COPY . /app

# Comando para iniciar el servidor Rails
CMD ["rails", "server", "-b", "0.0.0.0"]
