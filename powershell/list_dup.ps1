[cmdletBinding(defaultParameterSetName="list")]
param(
	[parameter(mandatory=$true, position=0)]
	[validateScript({
		test-path -literalPath $(resolve-path -literalPath $_) -pathType container
	})]
	[string]$path,

	[switch]$recurse=$false,

	[parameter(parameterSetName="list")]
	[switch]$list,

	[parameter(parameterSetName="group")]
	[switch]$group,

	[parameter(parameterSetName="moveto")]
	[validateScript({
		test-path -literalPath $_ -pathType container
	})]
	[string]$moveto
)

$path = resolve-path -literalPath $path

$files = get-childItem -literalPath $path -recurse:$recurse |
	where-object {!$_.psIsContainer -and $_.length -gt 0} |
	sort-object length, lastWriteTime |
	group-object length |
	where-object {$_.count -gt 1} |
	foreach-object {
		$_.group | foreach-object {
			$hash = get-fileHash -literalPath $_.fullName -algorithm sha1
			$_ | add-member noteProperty hash $hash.hash
		}
		$_
	} |
	select-object -expand group |
	group-object hash |
	where-object {$_.count -gt 1}

if($psCmdlet.parameterSetName -eq "group"){
	foreach($file in $files){
		$file.group | format-table length, lastWriteTime, fullName
	}
}else{
	$files = $files |
		foreach-object {
			$_.group | select-object -skip 1
		}
	if($psCmdlet.parameterSetName -eq "list"){
		$files | write-output
	}else{
		foreach($file in $files){
			$p = $file.fullName.substring($path.length + 1)
			$sub = split-path $p -parent
			if($sub){
				mkdir -force $(join-path $moveto $sub) | out-null
			}
			$dst = join-path $moveto $p
			move-item -literalPath $file.fullName -destination $dst -passthru
		}
	}
}
