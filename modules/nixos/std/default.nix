{
  inputs,
  lib,
  config,
  ...
}: {
  # Locale info
  time.timeZone = "America/Boise";
  i18n = rec {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = lib.genAttrs [
      "LC_ADDRESS"
      "LC_IDENTIFICATION"
      "LC_MEASUREMENT"
      "LC_MONETARY"
      "LC_NAME"
      "LC_NUMERIC"
      "LC_PAPER"
      "LC_TELEPHONE"
      "LC_TIME"
    ] (_: defaultLocale);
  };

  # Tool for managing nix and NixOS
  programs.nh = {
    enable = true;
    clean.enable = true;
  };

  sops = {
    defaultSopsFile = "${inputs.self}/SECRETS/${config.networking.hostName}.yaml";
    defaultSopsFormat = "yaml";
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
}
