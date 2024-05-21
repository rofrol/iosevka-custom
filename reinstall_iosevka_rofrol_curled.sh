#!/usr/bin/env bash
# https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script/246128#246128
DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
echo ${DIR}
ln -sf ${DIR}/private-build-plans.toml ${DIR}/vendor/Iosevka/private-build-plans.toml &&
	cd ${DIR}/vendor/Iosevka &&
	npm run build -- ttf-unhinted::iosevka-rofrol-curled &&
	# open ${DIR}/vendor/Iosevka/dist/iosevka-rofrol-curled/TTF-Unhinted/iosevka-rofrol-curled-Regular.ttf
	cd ${DIR}/vendor/FontPatcher &&
	fontforge -script font-patcher --complete ${DIR}/vendor/Iosevka/dist/iosevka-rofrol-curled/TTF-Unhinted/iosevka-rofrol-curled-Regular.ttf &&
	cp IosevkaRofrolCurledNerdFont-Regular.ttf ${DIR}/ &&
	open -a Font\ Book ${DIR}/IosevkaRofrolCurledNerdFont-Regular.ttf
