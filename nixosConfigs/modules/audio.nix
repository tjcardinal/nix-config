{
  # Disable pulseaudio to prevent conflicts with pipewire
  hardware.pulseaudio.enable = false;

  # rtkit is optional but recommended. It helps give pipewire realtime priority
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
