{
  lib,
  config,
  ...
}:
lib.internal.mkOptionalModule config "ssh" {
  services = {
    openssh = {
      enable = true;
      banner = ''
        ***WARNING***
        This system is for use by authorized persons only.
        All connections and activities are monitored and indefinitely logged.
        If you are not authorized to access this system, or you do not agree to this monitoring, DISCONNECT NOW.
        Unauthorized access may be subject to prosecution.
      '';
      settings = {
        PermitRootLogin = "no";
        PrintMotd = true;
      };
    };
    fail2ban.enable = true;
  };
}
