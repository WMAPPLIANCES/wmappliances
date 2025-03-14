FROM ubuntu:22.04 AS build

RUN apt-get update && apt-get install -y wget unzip git xz-utils libglu-dev

# Use a versão STABLE 3.13.7 (que realmente existe no repositório)
RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.7-stable.tar.xz -O flutter.tar.xz \
    && tar xf flutter.tar.xz \
    && mv flutter /usr/local/flutter

ENV PATH="/usr/local/flutter/bin:${PATH}"
RUN git config --global --add safe.directory /usr/local/flutter
RUN flutter doctor

WORKDIR /app
COPY pubspec.* /app/
RUN flutter pub get

COPY . /app/
RUN flutter build web --release

FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
