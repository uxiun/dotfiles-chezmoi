function mvfs -d "mvと同時に同じ名前の文件を消去"
	set_args_target $argv
	if test -d $target
		for arg in $args
			if test -f $arg
				set_filename_extension $arg
				if test $status -eq 0
					mv $arg $target
					rm $dir/$filename.*
					if test $extension = fs
						set -l fsproj (fd -Id 4 -e fsproj)[1]
						set -l srcdir $dir
						set -l srcname $filename
						set_dir_file $fsproj
						set -l include (string replace -r "^$dir" '' $target)

						string match -r ''

						sed -i -e "s/Include=\"[^./]*$\""
					end
				end
			else
				if test -d $arg
					mv $arg $target
				end
			end
		end
	end
end