# FIXME: Infinite recursion?!
{
  lib,
  config,
  ...
}: let
  usernames = builtins.attrNames (lib.filterAttrs (k: v: v.isNormalUser) config.users.users);
in
  lib.internal.mkOptionalModule config "managed-passwords" {
    sops.secrets = lib.genAttrs (map (n: "passwords/${n}") usernames) (path: {neededForUsers = true;});
    users.users = lib.genAttrs usernames (username: {hashedPasswordFile = config.sops.secrets."passwords/${username}".path;});
  }
