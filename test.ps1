#!/usr/bin/env pwsh

$libs = @('lib1', 'lib2')
$target = 'aarch64-apple-ios'
#$target = 'x86_64-apple-darwin'

foreach ($lib in $libs) {
	Push-Location
	Set-Location $lib
	$(cargo clean)
	$(cargo build --release --target $target)
	$symbols = "$(nm -g ./target/$target/release/lib${lib}.a | grep " T " | cut -d " " -f 3)".Split(" ")
	if ($lib -eq "lib1") {
		$lib1_symbols = $symbols
	} else {
		$lib2_symbols = $symbols
	}
	Pop-Location
}

$common_symbols = $lib1_symbols | ? { $lib2_symbols -Contains $_ }

foreach ($symbol in $common_symbols) {
	Write-Host $symbol	
}
