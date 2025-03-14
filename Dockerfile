# ------------------------------
# Fase 1: Construir o Flutter Web
# ------------------------------
FROM cirrusci/flutter:3.10.0 AS build
# ^ Ajuste aqui para uma versão >= 3.10 (ou stable)

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
