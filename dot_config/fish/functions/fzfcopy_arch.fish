function fzfcopy
	set -l fzfresult (fzf --preview "bat --style=numbers --color=always --line-range :500 {}")
	set -l cwd (pwd)
	set -l t "\\\wsl.localhost\arch$cwd/$fzfresult"
	echo $t | win32yank.exe -i
end