function echopath -d "echo $PATH and format"
	string replace ":" "\n" $PATH
	return 0
end