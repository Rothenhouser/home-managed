# Neovim settings

{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    extraConfig = ''
      :inoremap jk <Esc>
    '';

    plugins = with pkgs.vimPlugins; [
      vim-nix
    ];
  };
}
