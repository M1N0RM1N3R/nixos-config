{
  lib,
  config,
  ...
}:
lib.internal.mkOptionalModule config "git" {
  programs = {
    git = {
      enable = true;
      lfs.enable = true;
      userEmail = "m1n0rm1n3r@proton.me";
      userName = "PickSquid";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
    gh.enable = true;
    gpg.enable = true;
  };
}
