# wm-app

A new Flutter project.

## Getting Started

FlutterFlow projects are built to run on the Flutter _stable_ release.



# ------------------------
# Estágio de Build (Flutter Web)
# ------------------------
FROM debian:stable-slim AS build

# 1. Instala dependências + usuário não-root
RUN apt-get update && apt-get install -y \
    curl git unzip xz-utils libglu1-mesa ca-certificates \
    --no-install-recommends && \
    update-ca-certificates && \
    useradd -m flutteruser

# 2. Instala Flutter como usuário normal
USER flutteruser
WORKDIR /home/flutteruser
ENV FLUTTER_HOME="/home/flutteruser/flutter"
ENV PATH="$FLUTTER_HOME/bin:$PATH"

RUN git clone https://github.com/flutter/flutter.git \
    -b stable \
    --depth 1 \
    $FLUTTER_HOME

# 3. Configura ambiente
RUN flutter doctor -v && flutter config --enable-web

# 4. Copia e builda o projeto
WORKDIR /app
COPY --chown=flutteruser . .
RUN flutter pub get && flutter build web --release

# ------------------------
# Estágio Final (NGINX)
# ------------------------
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 80
