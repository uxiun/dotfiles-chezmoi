function gcco
	set -l filename (string split -m1 . (path basename $argv[1]))[1]
	gcc -o "$filename$argv[2]" $argv[1]
end
