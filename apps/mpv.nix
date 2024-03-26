{ pkgs, ... }:

{
  programs.mpv = {
		enable = true;
		package = pkgs.wrapMpv (pkgs.mpv-unwrapped.override {}) { youtubeSupport = true; };
		scripts = with pkgs.mpvScripts; [ mpris uosc thumbfast sponsorblock quality-menu ];
		defaultProfiles = [ "high-quality" ]; # https://github.com/mpv-player/mpv/blob/master/etc/builtin.conf
		config = {
			# https://github.com/mpv-player/mpv/blob/master/DOCS/man/options.rst
			# UI
			autofit = "70%";

			# Video
			vo = "gpu-next";
			gpu-api = "vulkan";
			hwdec = "auto-safe";

      # Audio
      ao = "pipewire";
      alang = "jpn,jp,eng,en";

			# Subtitles
			slang = "eng,en";
			sub-auto = "fuzzy";

      # Screenshots
      screenshot-directory = "~/Pictures";
      screenshot-template = "mpv-%f-%wH.%wM.%wS.%wT-#%#00n"; # name-hour-minute-second-millisecond-ssnumb

      # Shaders
      glsl-shader = "~~/shaders/default.glsl";
      deband = "yes";
		};
		# bindings = {
		# 	"+" = "add volume 2";
		# 	"-" = "add volume -2";
		# };
		scriptOpts.uosc = {
		# https://github.com/tomasklaen/uosc/blob/main/src/uosc.conf
			controls = "menu,space,subtitles,<has_many_audio>audio,<has_many_video>video,<has_many_edition>editions,<stream>stream-quality";
		};
	};

  home.file = {
		# https://github.com/iwalton3/default-shader-pack/tree/master/shaders
    ".config/mpv/shaders/default.glsl".source = "${pkgs.mpv-shim-default-shaders}/share/mpv-shim-default-shaders/shaders/FSR.glsl";
  };
}
