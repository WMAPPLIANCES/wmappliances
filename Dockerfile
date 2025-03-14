# ------------------------------
# Fase 1: Construir o Flutter Web
# ------------------------------
FROM cirrusci/flutter:3.7.0 AS build
# ^ Ajuste a versão do Flutter caso queira

WORKDIR /app

# Copia pubspec.yaml e pubspec.lock (se houver) para cache das dependências
COPY pubspec.* /app/
RUN flutter pub get

# Copia todo o restante do código
COPY . /app/

# Compila para Web (release)
RUN flutter build web --release

# ------------------------------
# Fase 2: Servir arquivos estáticos
# ------------------------------
FROM nginx:alpine

# Copia os arquivos resultantes do build (build/web) para NGINX
COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 80

# Inicia o NGINX
CMD ["nginx", "-g", "daemon off;"]
