# Defined in - @ line 0
function gds --description 'alias gds=git diff --staged'
	git diff --staged $argv;
end
