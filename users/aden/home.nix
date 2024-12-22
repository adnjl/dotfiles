{pkgs, inputs, system, ...}: {

  imports = [
    ../../home/core.nix
    ../../home/linux/${system}    
    # ../../home/packages
    ../../home/packages/${system}
  ];
}
