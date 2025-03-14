# ------------------------------
# Fase 1: Construir o Flutter Web
# ------------------------------
FROM cirrusci/flutter:3.7.0 AS build
# ^ Usa uma imagem que já vem com Flutter pré-instalado
#   Ajuste a versão se quiser (pode ser 3.3.x, 3.10.x, etc.)

WORKDIR /app

# Copia o pubspec e (se tiver) pubspec.lock para cache
COPY pubspec.* /app/
RUN flutter pub get

# Copia todo o código
COPY . /app/

# Compila para Web (release)
RUN flutter build web --release

# ------------------------------
# Fase 2: Servir arquivos estáticos
# ------------------------------
FROM nginx:alpine

# Copia os arquivos do build (pasta build/web) para o NGINX
COPY --from=build /app/build/web /usr/share/nginx/html

# Expõe a porta 80 (padrão do NGINX)
EXPOSE 80

# Mantém o NGINX rodando
CMD ["nginx", "-g", "daemon off;"]
