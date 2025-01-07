{
  pkgs,
  pkgs-unstable,
  ...
}:

{

  # TODO: is v3 better?
  # programs = {
  #   openvpn3.enable = true;
  # };

  environment.systemPackages = with pkgs; [
    awscli2
    openvpn
  ];
}
