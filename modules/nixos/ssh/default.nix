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
        All connections and activities are monitored to protect against abuse and unauthorized access attempts.
        DISCONNECT NOW if you do not:
          - own this system, or
          - have EXPLICIT, WRITTEN permission to access this system and
          - agree to the aforementioned logging of your activities.
        Unauthorized access may be subject to prosecution.

        To contact the administrator of this system, please email contact[at]m1n3r[dot]anonaddy[dot]com.
      '';
      settings = {
        PermitRootLogin = "no";
        PrintMotd = true;
      };
    };
    fail2ban.enable = true;
  };
}
