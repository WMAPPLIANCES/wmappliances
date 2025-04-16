FROM cirrusci/flutter:3.19.3

WORKDIR /app

COPY . .

RUN flutter pub get
RUN flutter build web --release

EXPOSE 8080

CMD ["sh", "-c", "cd build/web && dart pub global activate dhttpd && dhttpd --port=8080"]
