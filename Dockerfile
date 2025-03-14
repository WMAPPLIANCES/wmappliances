# ------------------------------
# Fase 1: Construir o Flutter Web
# ------------------------------
FROM cirrusci/flutter:3.13.0 AS build
# Tente "3.13.2" ou "stable" caso a 3.13.0 não exista

WORKDIR /app

COPY pubspec.* /app/
RUN flutter pub get

COPY . /app/
RUN flutter build web --release

# ------------------------------
# Fase 2: Servir arquivos estáticos
# ------------------------------
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
