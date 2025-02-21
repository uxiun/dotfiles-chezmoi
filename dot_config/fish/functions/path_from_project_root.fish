function path_from_project_root
	set -l root (path dirname (fd -Id 8 'package.json|Cargo.toml|dune-project|.fsproj'))

	path dirname $
end