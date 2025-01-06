{lib, ...}: {
  mkOptionalModule = config: name: contents: {
    options.optionalModules.${name}.enable = lib.mkEnableOption name;
    config = lib.mkIf config.optionalModules.${name}.enable contents;
  };
  use = loader: items:
    lib.foldl (lib.recursiveUpdate) {} (
      map loader items
    );
}
