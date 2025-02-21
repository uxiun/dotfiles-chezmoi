function gcc_run
	argparse "std=" "o=" "r/rm" -- $argv

	if test -n "$_flag_std"
		set -l flagstd "-std=$_flag_std"
	end

	if test -n "$_flag_r"
		set -e _flag_o
	end

	# -- の前はgcc, 後は./a.out に渡したい
	# while test -eq

	if test -n "$_flag_o" # ""で囲む必要あり
		# echo "gcc $flagstd -o $_flag_o $argv"
		gcc $flagstd -o $_flag_o $argv
		if test $status -eq 0
			./$_flag_o
		end

	else
		# echo "gcc $flagstd $argv"
		gcc $flagstd $argv
		if test $status -eq 0
			./a.out
		end

		if test -n "$_flag_r"
			rm ./a.out
		end
	end


	# if test -n $_flag_std

	# 	if test -z $_flag_o -o $_flag_r


	# 		gcc -std=$_flag_std $argv

	# 		if test $status -eq 0
	# 			./a.out
	# 		end

	# 		if test -n $_flag_r
	# 			rm ./a.out
	# 		end

	# 	else
	# 		gcc -std=$_flag_std -o $_flag_o $argv

	# 		if test $status -eq 0
	# 			./$_flag_o
	# 		end
	# 	end
	# else
	# 	if test -z $_flag_o -o $_flag_r
	# 		gcc $argv

	# 		if test $status -eq 0
	# 			./a.out
	# 		end

	# 		if test -n $_flag_r
	# 			rm ./a.out
	# 		end

	# 	else
	# 		gcc -o $_flag_o $argv
	# 		if test $status -eq 0
	# 			./$_flag_o
	# 		end
	# 	end
	# end

end