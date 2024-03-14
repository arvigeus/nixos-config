{ pkgs, ... }:

{
  programs.mpv = {
		enable = true;
		package = pkgs.wrapMpv (pkgs.mpv-unwrapped.override {}) { youtubeSupport = true; };
		scripts = with pkgs.mpvScripts; [ mpris uosc thumbfast sponsorblock quality-menu ];
		# config.force-window = "immediate";
		# bindings = {
		# 	"+" = "add volume 2";
		# 	"-" = "add volume -2";
		# };
		scriptOpts.uosc = {
      timeline_size = 10;
		# 	timeline_size_min = 1;
		# 	timeline_persistency = "paused,audio";
			controls = "menu,space,subtitles,<has_many_audio>audio,<has_many_video>video,<has_many_edition>editions,<stream>stream-quality";
		# 	# volume = "none";
		# 	window_border_size = 0;
		# 	# pause_indicator = "none";
		};
	};
}
