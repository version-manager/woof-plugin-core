# shellcheck shell=bash

nodejs.env() {
	var.get_dir 'plugins-data'
	local global_common_dir="$REPLY"
}

nodejs.table() {
	p.run_bash 'nodejs'
}

nodejs.install() {
	local url="$1"
	local version="$2"

	p.fetch -o './file.tar.gz' "$url"
	p.unpack './file.tar.gz'
	p.mkdir './dir'
	p.ensure mv ./*/* './dir'

	REPLY_DIR='./dir'
	REPLY_BINS=('./bin')
	REPLY_MANS=('./share/man/man1')
}
