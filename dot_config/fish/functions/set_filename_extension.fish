function set_filename_extension
	set_dir_file $argv[1]
	set -l tuple (string split -m1 . $file)
	set -g filename $tuple[1]
	if test -n $tuple[2]
		set -g extension $tuple[2]
	else
		echo "hidden file? which cannot deal with"
	end
end