function montage_uec4
	set -l address (pwd)
	cd /home/u/school/class/mast-ai/UECFOODPIXCOMPLETE/data/train/img
	set -l names (path basename $argv)
	set -l output (string join _ $names)
	set -l input (string replace -r '$' .jpg $argv)
	montage $input ../c/$output.jpg
	cd $address
end