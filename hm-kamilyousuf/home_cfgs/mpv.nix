{
  programs.mpv = {
    enable = true;
    config = {
	hwdec = "auto";
	hwdec-codecs = "all";
	resume-playback = true;
	save-position-on-quit = true;
    };
  };
}
