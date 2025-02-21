function git_clone_dir -d "clone subfolder of git repo"
	set -l userrepo $argv[1]
	set -l res (string split / $userrepo)
	if test 2 -eq (count $res)
		set -l url (string join "" "https://github.com/" $userrepo)
		
		set -l subfolders $argv[2..]
		# echo $subfolders
		
		if test -z $subfolders
			git clone $url 
		else
			set -l dir $res[2]
			if test -d $dir
			else
				git clone -n --depth=1 --filter=tree:0 $url
			end
			cd $dir
			if test $status -eq 0
				git sparse-checkout set --no-cone $subfolders
				git checkout
				cd ..
			end
		end
	else
		string match -rq 'https://github\.com/(?<user>[^/]+)/(?<repo>[^/]+)/?(?<subpath>\S+)' $userrepo
		set -l subfolders $argv[2..]
		
		if test $status -eq 0
			git_clone_dir $user/$repo $subpath $subfolders
		else
			if test -d $userrepo
				cd $dir
				if test $status -eq 0
					git sparse-checkout set --no-cone $subfolders
					git checkout
					cd ..
				end
			else
				echo "could not parse github url, nor as existing directory"
			end
		end
	end
end