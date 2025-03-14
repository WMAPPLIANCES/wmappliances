# ------------------------------
# Fase 1: Construir o Flutter Web
# ------------------------------
FROM ubuntu:22.04 AS build

# Instala dependências necessárias
RUN apt-get update && apt-get install -y wget unzip git xz-utils libglu-dev

# Baixa e instala Flutter (beta ou master) que inclua Dart >= 3.2
RUN wget https://storage.googleapis.com/flutter_infra_release/releases/beta/linux/flutter_linux_3.14.0-2.0.pre-beta.tar.xz -O flutter.tar.xz \
    && tar xf flutter.tar.xz \
    && mv flutter /usr/local/flutter

# Adiciona Flutter ao PATH
ENV PATH="/usr/local/flutter/bin:${PATH}"

# Evita warning de "dubious ownership" ao rodar flutter
RUN git config --global --add safe.directory /usr/local/flutter

# Verifica se o Flutter está ok (deverá mostrar Dart >= 3.2)
RUN flutter doctor

# Copia apenas pubspec.* para instalar dependências primeiro (cache)
WORKDIR /app
COPY pubspec.* /app/
RUN flutter pub get

# Copia todo o código
COPY . /app/

# Compila para Web (release)
RUN flutter build web --release

# ------------------------------
# Fase 2: Servir arquivos estáticos com NGINX
# ------------------------------
FROM nginx:alpine

# Copia o resultado do build para a pasta pública do NGINX
COPY --from=build /app/build/web /usr/share/nginx/html

# Expõe a porta 80
EXPOSE 80

# Inicia o NGINX em primeiro plano
CMD ["nginx", "-g", "daemon off;"]
