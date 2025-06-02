{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		cryptsetup
	];

	# boot.initrd.luks.devices."drive" = {
	#	device = "/dev/disk/by-uuid/ba994a17-cd32-402e-9314-b143237c184f";
	#	keyFile = "/root/luks-keyfile";
	#};

	# fileSystems."/drive" = {
	#	device = "/dev/mapper/drive";
	#	fsType = "ext4";
	#};
}

