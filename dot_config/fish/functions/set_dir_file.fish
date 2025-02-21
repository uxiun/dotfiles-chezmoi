function set_dir_file
	set -l a $argv[1]
	set -l res (string split -r -m1 / $a)
	# set -l c (count $res)

	if test -n $res[2]
		set -g dir $res[1]
		set -g file $res[2]
	else
		set -g file $res[1]
	end
end