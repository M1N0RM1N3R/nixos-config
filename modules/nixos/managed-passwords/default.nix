{
  lib,
  config,
  ...
}: let
  name = "managed-passwords";
in {
  options.optionalModules.${name} = {
    enable = lib.mkEnableOption name;
    forUsers = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      description = "List of usernames to manage passwords for.";
    };
  };
  config = let
    usernames = config.optionalModules.${name}.forUsers;
  in
    lib.mkIf config.optionalModules.${name}.enable {
      sops.secrets = lib.genAttrs (map (n: "passwords/${n}") usernames) (path: {neededForUsers = true;});
      users.users = lib.genAttrs usernames (username: {hashedPasswordFile = config.sops.secrets."passwords/${username}".path;});
    };
}
