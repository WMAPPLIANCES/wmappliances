# -------------------------
# Etapa 1: Instalar dependências no Ubuntu
# -------------------------
FROM ubuntu:22.04

# Instala pacotes necessários
RUN apt-get update && apt-get install -y wget unzip git xz-utils libglu-dev

# Baixa e instala Flutter Beta (que tenha Dart >= 3.2)
RUN wget https://storage.googleapis.com/flutter_infra_release/releases/beta/linux/flutter_linux_3.14.0-2.0.pre-beta.tar.xz \
    && tar xf flutter.tar.xz \
    && mv flutter /usr/local/flutter

# Adiciona Flutter ao PATH
ENV PATH="/usr/local/flutter/bin:${PATH}"

# (Opcional) Evitar warning de "dubious ownership"
RUN git config --global --add safe.directory /usr/local/flutter

# Checa se o Flutter está funcionando e em Beta
RUN flutter doctor

WORKDIR /app

# Copia pubspec.yaml para instalar dependências
COPY pubspec.* /app/
RUN flutter pub get

# Copia todo o código
COPY . /app/

# Faz build do Flutter Web
RUN flutter build web --release

# -------------------------
# Etapa 2: Servir com NGINX
# -------------------------
FROM nginx:alpine
COPY --from=0 /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
