# 作rust用module, src/下 hoge.rs and hoge/
function rsmodule

	if test -e Cargo.toml

	set -l unuseds
	set -l useds
	set -l prefix src/

	set -l lib src/lib.rs
	if test -e $lib
	else
		mkentries $lib.
	end

	for arg in $argv
		set -l res (string match "*/" $arg)
		if test -z $res
			set -l a $prefix$arg
			set_dir_file $a
			if test -z $dir
				set -l res (string match "*.rs" $file)
				if test -z $res
					set file $file.rs
				end

				if test -e $file
				else
					mkentries $file
				end

			else
				install -D /dev/null $a.rs
			end

		else
			# set prefix src/$arg
			# set -l a src/$res.rs
			# if test -e $a
			# else
			# 	echo "pub mod $res;" >> $a
		end
	end


	else
		echo "current directory is not the root of rust project"
	end
end