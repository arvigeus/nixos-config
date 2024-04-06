{...}: {
  programs.chromium = {
    enable = true;

    # package = pkgs.ungoogled-chromium;
    enablePlasmaBrowserIntegration = true;

    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock-origin
      "nngceckbapebfimnlniiiahkandclblb" # bitwarden-free-password-m
      "fmkadmapgofadopljbjfkapdkoienihi" # react-developer-tools
      "gppongmhjkpfnbhagpmjfkannfbllamg" # wappalyzer-technology-pro
      "gccemnpihkbgkdmoogenkbkckppadcag" # webhint
      "ponfpcnoihfmfllpaingbgckeeldkhle" # enhancer-for-youtube
      "cnojnbdhbhnkbcieeekonklommdnndci" # search-by-image
      "kbfnbcaeplbcioakkpcpgfkobkghlhen" # grammarly-ai-writing-and
      "bmnlcjabgnpnenekpadlanbbkooimhnj" # paypal-honey-automatic-co
      "pfldomphmndnmmhhlbekfbafifkkpnbc" # cultivate-amazon-product
      "ghnomdcacenbmilgjigehppbamfndblo" # the-camelizer
    ];

    # https://chromeenterprise.google/policies/
    extraOpts = {
      BookmarkBarEnabled = true;
      BrowserSignin = 0;
      DefaultBrowserSettingEnabled = false;
      DefaultSearchProviderEnabled = true;
      DefaultSearchProviderSearchURL = "https://encrypted.google.com/search?q={searchTerms}&amp;{google:RLZ}{google:originalQueryForSuggestion}{google:assistedQueryStats}{google:searchFieldtrialParameter}{google:searchClient}{google:sourceId}{google:instantExtendedEnabledParameter}ie={inputEncoding}";
      defaultSearchProviderSuggestURL = "https://encrypted.google.com/complete/search?output=chrome&amp;q={searchTerms}";
      PasswordManagerEnabled = false;
      ShowAppsShortcutInBookmarkBar = false;
      SyncDisabled = true;
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      AllowDeletingBrowserHistory = true;
      BuiltInDnsClientEnabled = false;
      MetricsReportingEnabled = true;
      SearchSuggestEnabled = false;
      AlternateErrorPagesEnabled = false;
      UrlKeyedAnonymizedDataCollectionEnabled = false;
      SpellcheckEnabled = true;
      SpellcheckLanguage = ["en-US" "bg"];
      CloudPrintSubmitEnabled = false;
      RestoreOnStartup = 1;
    };
  };

  # Allow Google Sync for Chromium
  # These keys are from public web
  # environment.sessionVariables = {
  #   GOOGLE_DEFAULT_CLIENT_ID = "77185425430.apps.googleusercontent.com";
  #   GOOGLE_DEFAULT_CLIENT_SECRET = "OTJgUOQcT7lO7GsGZq2G4IlT";
  # };
}
