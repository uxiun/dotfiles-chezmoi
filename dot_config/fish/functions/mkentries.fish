function mkentries -d "create files or directo" -w ls
	set -l unuseds
	set -l useds
	for a in $argv
		if test -e $a
			set -a unuseds $a
		else
			set -l res (string match "*/" $a)
			# if test $status -eq 0
			if test -z $res
				install -D /dev/null $a
			else
				mkdir -p $a
			end
			set -a useds $a
		end
	end
	for e in $useds
		echo $e 
	end

	# for e in $unuseds
	# 	echo "exist: $e"
	# end
end
