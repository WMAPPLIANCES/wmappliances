# Use uma versão do Flutter com Dart >=3.0.0
FROM flutter:3.13.0

WORKDIR /app

# Copia pubspec.yaml e pubspec.lock
COPY pubspec.* ./

# Executa pub get sem flags extras
RUN flutter pub get

# Copia o restante do código
COPY . .

# Comandos subsequentes (build, etc.)
