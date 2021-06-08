# git settings

{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    # make this profile-dependent how?
    userName = "Rothenhouser";
    userEmail = "Rothenhouser@users.noreply.github.com";

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
