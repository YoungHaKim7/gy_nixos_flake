{ pkgs, ... }: {
  home.username = "gy";
  home.homeDirectory = "/home/gy";

  # Install user packages
  home.packages = [
    pkgs.htop
    pkgs.git
  ];

  # Configure tools
  programs.bash.enable = true;
  programs.git = {
    enable = true;
    userName = "GYoung";
    userEmail = "ytok1108@aol.com";
  };

  home.stateVersion = "25.11"; # Match your system's NixOS version
  programs.home-manager.enable = true;
}
