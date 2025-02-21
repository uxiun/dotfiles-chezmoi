# 作rust用module, src/下 hoge.rs and hoge/
function rsmod -d "add rust module. `rsmod folder/ file` -> folder.rs: pub mod file; folder/file.rs"
	set -l cded 0
	if test -e Cargo.toml
		cd src
		set cded 1
		mkentries lib.rs
	end

	set -U prefix

	rsmodinner -c $cded $argv

	set -e prefix

	# for arg in $argv
	# 	mkentries $arg.rs
	# 	set_dir_file $arg
	# 	if test -z $dir
	# 		if test -z $file
	# 		else
	# 			if test $cded -eq 1
	# 				# sed -i "1ipub mod $file;" $lib
	# 				echo "pub mod $file;" >> lib.rs
	# 			end
	# 		end
	# 	else
	# 		set -l lib $file
	# 			# set lib src/lib.rs
	# 		mkentries $dir.rs
	# 		echo "pub mod $file;" >> $dir.rs
	# 		rsmod $dir
	# 	end
	# end

	if test $cded -eq 1
		cd ..
	end


end