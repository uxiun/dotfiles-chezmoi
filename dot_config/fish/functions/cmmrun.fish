function cmmrun -d "cmm parse and run outputted jasmin code"
	set -l argc (count $argv)
	set -l name (string split -m10 . (path basename $argv[1]))[1]
	if test $argc -eq 1
		ruby Parser.ruby < $argv[1] > $name.j
	else if test $argc -eq 2
		ruby $argv[2] < $argv[1] > $name.j
	else
		echo "error: argv len must be 1 or 2"
	end
	java ~/school/compiler/jasmin-2.4/jasmin.jar $name.j
	java cmm
end

