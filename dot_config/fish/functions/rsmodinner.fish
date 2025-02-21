# 作rust用module, src/下 hoge.rs and hoge/
					# sed -i "1ipub mod $file;" $lib
					# echo "pub mod $file;" >> lib.rs
function rsmodinner
	argparse "c=" -- $argv
	# argparse "p=" -- $argv
	# set -l prefix $_flag_p
	for arg in $argv
		set_dir_file $arg
		if test -z $dir
			# echo "mkentries $prefix$arg.rs"
			mkentries $prefix$arg.rs
			set -l prefix (string replace / "" $prefix)
			if test $_flag_c -eq 1
				set lib lib.rs
				if test -z $prefix
				else
					set lib $prefix.rs
				end
				append_unique_line "pub mod $file;" $lib
			else
				if test -z $prefix
				else
					set lib $prefix.rs
					append_unique_line "pub mod $file;" $lib
				end
			end
		else
			# mkentries $prefix$dir.rs
			if test -z $file

				rsmodinner -c $_flag_c $dir
				set -g prefix $arg
			else
				# echo "mkentries $prefix$dir.rs $prefix$arg.rs"
				mkentries $prefix$dir.rs $prefix$arg.rs
				append_unique_line "pub mod $file;" $prefix$dir.rs
				# rsmodinner -c $_flag_c -p $prefix $dir
				rsmodinner -c $_flag_c $dir
			end
		end
	end


end