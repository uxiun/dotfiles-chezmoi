function montage_uec4_file
	set -l address (pwd)
	cd /home/u/school/class/mast-ai/UECFOODPIXCOMPLETE/data/train/img
	cat $argv | set -l target
	set -l names (path basename $argv)
	set -l output (string join _ $names)
	montage $argv ../c/$output.jpg
end