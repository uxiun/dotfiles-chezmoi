function set_args_target
	set -g args $argv[..-2]
	set -l last $argv[-1]
	if test -e $last
		set -g target $last
	else
		echo "last arg does not exist"
		# set -g status 1
	end
end