
function loop_yong_run -d "loop cargo run (ensure cwd=yong-trans/)"
	cargo run
	rg ^...[,\.] $argv | wc -l
	loop_yong_run $argv
end