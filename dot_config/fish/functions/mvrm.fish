function mvrm -d "mvと同時に同じ名前の文件を消去"
	set_args_target $argv
	if test -d $target
		for arg in $args
			if test -f $arg
				set_filename_extension $arg
				if test $status -eq 0
					mv $arg $target
					rm $dir/$filename.*
				end
			else
				if test -d $arg
					mv $arg $target
				end
			end
		end
	end
end