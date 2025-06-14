{ ... }:
{
  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;

    # allow pipewire to play high sample rate audio
    extraConfig.pipewire.noresample = {
      "context.properties" = {
        "default.clock.allowed-rates" = [
          44100
          48000
          96000
          192000
        ];
      };
    };
  };
}
