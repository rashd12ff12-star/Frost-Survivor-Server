FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    libfontconfig1 \
    libx11-6 \
    libxcursor1 \
    libxext6 \
    libxi6 \
    libxinerama1 \
    libxrandr2 \
    librenderdoc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# تحميل وتثبيت محرك Godot Server 4.2.1 Headless
RUN wget https://github.com/godotengine/godot/releases/download/4.2.1-stable/Godot_v4.2.1-stable_linux.x86_64.zip \
    && unzip Godot_v4.2.1-stable_linux.x86_64.zip \
    && mv Godot_v4.2.1-stable_linux.x86_64 /usr/local/bin/godot \
    && chmod +x /usr/local/bin/godot \
    && rm Godot_v4.2.1-stable_linux.x86_64.zip

COPY . .

EXPOSE 8080

CMD ["godot", "--headless", "--main-pack", "project.godot"]
