
function pandoc_latex -d "edit latex output by pandoc"
	pandoc -so $argv[1] $argv[2]
	sed -i '1,10s/article/ltjsarticle/' $argv[1]
	sed -i '1,50s/ifLuaTex/ifLuaTex\n  \\usepackage[rm,up,sc,compact,topmarks,calcwidth,pagestyles]{titlesec} %題字の書体を明朝体に変更/' $argv[1]
	cat $argv[1] | win32yank.exe -i
end