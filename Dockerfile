FROM ubuntu:22.04

# Evitar prompts durante a instalação de pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependências
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    openjdk-11-jdk \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Definir variáveis de ambiente
ENV FLUTTER_HOME=/opt/flutter
ENV PATH $PATH:$FLUTTER_HOME/bin

# Baixar e configurar Flutter
RUN git clone https://github.com/flutter/flutter.git -b stable $FLUTTER_HOME
RUN flutter precache
RUN flutter doctor -v

# Configurar diretório de trabalho
WORKDIR /app

# Copiar o código-fonte
COPY . .

# Instalar dependências e compilar
RUN flutter pub get
RUN flutter build web --release

# Expor porta e iniciar servidor web
EXPOSE 8080

# Instalar e iniciar um servidor web simples para servir os arquivos estáticos
CMD cd build/web && \
    dart pub global activate dhttpd && \
    dhttpd --path=. --port=8080 || \
    (apt-get update && apt-get install -y python3 && python3 -m http.server 8080)
