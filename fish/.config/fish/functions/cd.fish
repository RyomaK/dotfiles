## cd後にls 
function cd 
	builtin cd $argv; and ls -a
end