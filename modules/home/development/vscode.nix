{
  lib,
  config,
  pkgs,
  inputs,
  system,
  ...
}: let
  pkg = pkgs.vscodium;
in
  lib.internal.mkOptionalModule config "vscode" {
    home.shellAliases = {
      code = "${pkg}/bin/codium";
    };
    programs.vscode = {
      enable = true;
      package = pkg;
      extensions = with inputs.nix-vscode-extensions.extensions.${system}.vscode-marketplace; [
        # From `codium --list-extensions` on my previous system, with broken/missing extensions commented out
        aaron-bond.better-comments
        adpyke.codesnap
        alefragnani.bookmarks
        almenon.arepl
        arrterian.nix-env-selector
        bierner.color-info
        bierner.docs-view
        bierner.emojisense
        bierner.markdown-mermaid
        bierner.markdown-preview-github-styles
        charliermarsh.ruff
        christian-kohler.path-intellisense
        continue.continue
        csharpier.csharpier-vscode
        davidanson.vscode-markdownlint
        dbaeumer.vscode-eslint
        donjayamanne.githistory
        dotjoshjohnson.xml
        eamodio.gitlens
        editorconfig.editorconfig
        edwinkofler.vscode-assorted-languages
        edwinkofler.vscode-hyperupcall
        edwinkofler.vscode-hyperupcall-pack-base
        edwinkofler.vscode-hyperupcall-pack-markdown
        eriklynd.json-tools
        esbenp.prettier-vscode
        github.vscode-github-actions
        github.vscode-pull-request-github
        gleam.gleam
        gruntfuggly.todo-tree
        jeff-hykin.macro-commander
        jnoortheen.nix-ide
        #jsw.csharpextensions
        kevinrose.vsc-python-indent
        leonardssh.vscord
        michelemelluso.gitignore
        mikoz.black-py
        ms-azuretools.vscode-docker
        ms-dotnettools.vscode-dotnet-runtime
        ms-pyright.pyright
        ms-python.debugpy
        ms-python.python
        ms-vscode.extension-test-runner
        #muhammad-sammy.csharp
        naumovs.color-highlight
        neikeq.godot-csharp-vscode
        njpwerner.autodocstring
        pinage404.nix-extension-pack
        rangav.vscode-thunder-client
        redhat.vscode-xml
        redhat.vscode-yaml
        ritwickdey.liveserver
        rust-lang.rust-analyzer
        serayuzgur.crates
        streetsidesoftware.code-spell-checker
        swellaby.rust-pack
        tailscale.vscode-tailscale
        tamasfe.even-better-toml
        ultram4rine.vscode-choosealicense
        unifiedjs.vscode-mdx
        usernamehw.errorlens
        vivaxy.vscode-conventional-commits
        waderyan.gitblame
        yzhang.markdown-all-in-one
      ];
    };
  }
