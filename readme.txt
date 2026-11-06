
      <----Display_Manager_Service ---->
        ===================
   systemctl status display-manager.service
 sudo systemctl disable --now UNIT.service    UNIT(менеджер входа?)
    sudo systemctl enable --now greetd
       sudo systemctl disable --now greetd
          sudo reboot

  <---- Install_System_Live: Arch_Linux Noctalia ----->
      ===========================

sudo pacman -S --needed base-devel meson just greetd dbus wayland wayland-protocols wlroots0.20 libinput libglvnd freetype2 fontconfig cairo pango harfbuzz libxkbcommon glib2 tomlplusplus nlohmann-json stb ibwebp libjxl librsvg libxml2

  <---- Install_System_Live: Debian_Linux Noctalia ----->
          ==========================

   wget https://pkg.noctalia.dev/deb/nickh-archive-keyring.deb && sudo dpkg -i nickh-archive-keyring.deb
   
   sudo wget -O /etc/apt/sources.list.d/noctalia-unstable.sources https://pkg.noctalia.dev/deb/noctalia-unstable.sources
   
sudo apt update
sudo apt install noctalia noctalia-greeter umbriel xdg-desktop-portal-umbriel

sudo systemctl restart greetd

sudo apt install meson g++ just greetd dbus libwayland-dev wayland-protocols libwlroots-0.20-dev libinput-dev libegl-dev libgles-dev libfreetype-dev libfontconfig-dev libcairo2-dev libpango1.0-dev libharfbuzz-dev libxkbcommon-dev libglib2.0-dev libtomlplusplus-dev nlohmann-json3-dev libstb-dev libwebp-dev libjxl-dev librsvg2-dev libxml2-dev


  <---- Install_System_Live: Debian_Linux MangoWm ----->
          ==========================
          
     sudo apt install meson cmake libdrm-dev wayland-protocols libweston-16-dev glslang-tools spirv-tools libxcb-icccm4-dev libcjson-dev
          
     git clone -b 0.20.2 https://gitlab.freedesktop.org/wlroots/wlroots.git
cd wlroots
meson build -Dprefix=/usr
sudo ninja -C build install

git clone -b 0.5 https://github.com/wlrfx/scenefx.git
cd scenefx
meson build -Dprefix=/usr
sudo ninja -C build install

git clone https://github.com/mangowm/mango.git
cd mango
meson build -Dprefix=/usr
sudo ninja -C build install

mkdir -p ~/.config/mango

cp /etc/mango/config.conf ~/.config/mango/config.conf

mango


        <------ Autologin_Arch_Linux Greetd ------>

sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo nano /etc/systemd/system/getty@tty1.service.d/autologin.conf

[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --noreset --noclear --autologin username - ${TERM}

