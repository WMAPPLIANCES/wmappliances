FROM ubuntu:22.04

# Instalar dependências do Flutter
RUN apt-get update && apt-get install -y wget unzip git xz-utils libglu-dev

# Baixar e instalar Flutter 3.x (exemplo)
RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.0-stable.tar.xz \
    && tar xf flutter_linux_3.13.0-stable.tar.xz \
    && mv flutter /usr/local/flutter

# Adicionar Flutter ao PATH
ENV PATH="/usr/local/flutter/bin:${PATH}"

# Habilitar os binários
RUN flutter doctor

WORKDIR /app
COPY pubspec.* /app/
RUN flutter pub get
COPY . /app/
RUN flutter build web --release

# Servir com NGINX
FROM nginx:alpine
COPY --from=0 /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
