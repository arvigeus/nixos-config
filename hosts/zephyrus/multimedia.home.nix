{ pkgs, ... }:

{
  programs.mpv = {
		enable = true;
		package = pkgs.wrapMpv (pkgs.mpv-unwrapped.override {}) { youtubeSupport = true; };
		scripts = with pkgs.mpvScripts; [ mpris uosc thumbfast sponsorblock quality-menu ];
		defaultProfiles = [ "high-quality" ]; # https://github.com/mpv-player/mpv/blob/master/etc/builtin.conf
		config = {
			# https://github.com/mpv-player/mpv/blob/master/DOCS/man/options.rst
			vo = "gpu-next";
			hwdec = "auto-safe";
			gpu-api = "vulkan";
			sub-auto = "fuzzy";
			alang = "jpn,en";
			slang = "en";
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

	programs.yt-dlp.enable = true;
}
