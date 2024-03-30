{...}: {
  programs.chromium = {
    enable = true;
    extensions = [
      {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # ublock-origin
      {id = "nngceckbapebfimnlniiiahkandclblb";} # bitwarden-free-password-m
      {id = "cimiefiiaegbelhefglklhhakcgmhkai";} # plasma-integration
      {id = "fmkadmapgofadopljbjfkapdkoienihi";} # react-developer-tools
      {id = "gppongmhjkpfnbhagpmjfkannfbllamg";} # wappalyzer-technology-pro
      {id = "gccemnpihkbgkdmoogenkbkckppadcag";} # webhint
      {id = "ponfpcnoihfmfllpaingbgckeeldkhle";} # enhancer-for-youtube
      {id = "cnojnbdhbhnkbcieeekonklommdnndci";} # search-by-image
      {id = "kbfnbcaeplbcioakkpcpgfkobkghlhen";} # grammarly-ai-writing-and
      {id = "bmnlcjabgnpnenekpadlanbbkooimhnj";} # paypal-honey-automatic-co
      {id = "pfldomphmndnmmhhlbekfbafifkkpnbc";} # cultivate-amazon-product
      {id = "ghnomdcacenbmilgjigehppbamfndblo";} # the-camelizer
    ];
  };
}
