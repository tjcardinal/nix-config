{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome = {
      enable = true;
      extraGSettingsOverrides = ''
        [org.gnome.desktop.interface]
        color-scheme='prefer-dark'
        enable-hot-corners=false
        show-battery-percentage=true

        [org.gnome.desktop.peripherals.mouse]
        accel-profile='flat'

        [org.gnome.desktop.peripherals.touchpad]
        natural-scroll=false
        tap-to-click=true
        two-finger-scrolling-enabled=true

        [org.gnome.desktop.session]
        idle-delay=uint32 0

        [org.gnome.desktop.wm.preferences]
        button-layout='appmenu:minimize,maximize,close'

        [org.gnome.mutter]
        dynamic-workspaces=true
        edge-tiling=true

        [org.gnome.settings-daemon.plugins.color]
        night-light-enabled=true

        [org.gnome.settings-daemon.plugins.power]
        sleep-inactive-ac-type='nothing'
        sleep-inactive-battery-type='nothing'

        [org.gnome.shell]
        favorite-apps=['org.gnome.Nautilus.desktop', 'org.gnome.Console.desktop', 'firefox.desktop', 'steam.desktop']
        last-selected-power-profile='performance'
      '';
      extraGSettingsOverridePackages = with pkgs; [
        gnome.gnome-settings-daemon gnome.gnome-shell gnome.mutter gsettings-desktop-schemas
      ];
    };
    excludePackages = with pkgs; [ xterm ];
  };

  environment.systemPackages = with pkgs.gnome; [ gnome-tweaks ];

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    epiphany
    geary
  ]);
}
