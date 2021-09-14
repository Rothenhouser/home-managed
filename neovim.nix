# Neovim settings

{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    # Sets alias vim=nvim
    # vimAlias = true;

    # this still needs to come from .vimrc so we can also
    # use that in .ideavimrc
    # hmmmm can I also deploy that with Nix?
    # extraConfig = ''
    #  :inoremap jk <Esc>
    # '';
    extraConfig = builtins.readFile ./.vimrc;

    plugins = with pkgs.vimPlugins; [
      # Language support
      vim-nix

      # UI
      # gruvbox
      # vim-airline

      # Editor features
      vim-surround  # move this to .vimrc
    ];
  };
}
