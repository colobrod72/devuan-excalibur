#!/usr/bin/env bash
# =============================================================================
# MangoWM Installer for Devuan Linux (OpenRC)
# =============================================================================
# Скрипт устанавливает MangoWM и все необходимые зависимости.
# Требуется запуск от имени пользователя с правами sudo.
# =============================================================================

set -euo pipefail

# --- Цвета для вывода ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

info()  { echo -e "${GREEN}[INFO]${NC} $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; }

# --- Проверка, что скрипт запущен не от root ---
if [[ $EUID -eq 0 ]]; then
    error "Скрипт нельзя запускать от имени root. Запустите его как обычный пользователь (sudo будет использоваться внутри)."
    exit 1
fi

# --- Проверка наличия sudo ---
if ! command -v sudo &>/dev/null; then
    error "Команда sudo не найдена. Установите sudo и настройте его для вашего пользователя."
    exit 1
fi

# --- Определение версий (при необходимости обновите) ---
WLROOTS_VERSION="0.20.2"
SCENEFX_VERSION="0.5"
WLROOTS_REPO="https://gitlab.freedesktop.org/wlroots/wlroots.git"
SCENEFX_REPO="https://github.com/wlrfx/scenefx.git"
MANGO_REPO="https://github.com/mangowm/mango.git"

# --- Временная директория для сборки ---
BUILD_DIR="$(mktemp -d /tmp/mango-build-XXXXXX)"
trap 'rm -rf "$BUILD_DIR"' EXIT

info "Временная директория для сборки: $BUILD_DIR"

# =============================================================================
# 1. Установка зависимостей из репозиториев Devuan
# =============================================================================
info "Обновление списка пакетов и установка зависимостей..."

sudo apt update

sudo apt install -y \
    build-essential git meson ninja-build \
    libwayland-dev wayland-protocols libinput-dev libdrm-dev \
    libxkbcommon-dev libpixman-1-dev libdisplay-info-dev libliftoff-dev \
    hwdata seatd libpcre2-dev libpango1.0-dev libcjson-dev \
    libxcb1-dev libxcb-util-dev xorg-xwayland \
    libpam-ck-connector

# =============================================================================
# 2. Настройка seatd (менеджер сессий для Wayland без elogind)
# =============================================================================
info "Настройка seatd..."

# Убедимся, что seatd запущен и добавлен в автозагрузку OpenRC
sudo rc-service seatd start || warn "Не удалось запустить seatd (возможно, уже запущен)."
sudo rc-update add seatd default || warn "Не удалось добавить seatd в автозагрузку (возможно, уже добавлен)."

# Добавляем текущего пользователя в группу video (требуется для доступа к устройствам)
if ! id -nG "$USER" | grep -qw video; then
    info "Добавление пользователя $USER в группу video..."
    sudo usermod -aG video "$USER"
    warn "Для применения изменений группы потребуется перелогиниться (или выполнить 'newgrp video')."
else
    info "Пользователь $USER уже состоит в группе video."
fi

# В Devuan пакет seatd по умолчанию может использовать аргумент -g video.
# Проверим /etc/default/seatd и при необходимости установим DAEMON_ARGS="-g video"
if [[ -f /etc/default/seatd ]]; then
    if ! grep -qE '^\s*DAEMON_ARGS=.*-g\s+video' /etc/default/seatd; then
        info "Настройка /etc/default/seatd для доступа группы video..."
        echo 'DAEMON_ARGS="-g video"' | sudo tee -a /etc/default/seatd >/dev/null
        sudo rc-service seatd restart || true
    fi
fi

# =============================================================================
# 3. Сборка и установка wlroots
# =============================================================================
info "Сборка wlroots $WLROOTS_VERSION..."

cd "$BUILD_DIR"
git clone -b "$WLROOTS_VERSION" --depth 1 "$WLROOTS_REPO" wlroots
cd wlroots

meson setup build --prefix=/usr --buildtype=release
sudo ninja -C build install

cd "$BUILD_DIR"

# =============================================================================
# 4. Сборка и установка scenefx
# =============================================================================
info "Сборка scenefx $SCENEFX_VERSION..."

git clone -b "$SCENEFX_VERSION" --depth 1 "$SCENEFX_REPO" scenefx
cd scenefx

meson setup build --prefix=/usr --buildtype=release
sudo ninja -C build install

cd "$BUILD_DIR"

# =============================================================================
# 5. Сборка и установка MangoWM
# =============================================================================
info "Сборка MangoWM..."

git clone --depth 1 "$MANGO_REPO" mango
cd mango

meson setup build --prefix=/usr --buildtype=release
sudo ninja -C build install

# =============================================================================
# 6. Обновление кеша динамических библиотек
# =============================================================================
info "Обновление кеша динамических библиотек..."
sudo ldconfig

# =============================================================================
# 7. Завершение
# =============================================================================
info "Установка MangoWM успешно завершена!"
echo ""
info "Что делать дальше:"
echo "  1. Если вы только что добавили пользователя в группу video,"
echo "     выйдите из системы и войдите снова (или выполните 'newgrp video')."
echo "  2. Скопируйте конфигурацию по умолчанию (если она есть) в ~/.config/mango/:"
echo "       mkdir -p ~/.config/mango"
echo "       cp /usr/share/defaults/mango/config.conf ~/.config/mango/ 2>/dev/null || true"
echo "  3. Запустите MangoWM из TTY командой: mango"
echo ""
warn "Если вы используете display manager, убедитесь, что сессия MangoWM доступна в списке."