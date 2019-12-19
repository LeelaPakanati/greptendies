#! /bin/sh
cd $(dirname "$0")
curl $(cat menusrc) -s | grep -f foods - | sed 's/^\s+//g;s/\n\s*([^$])/, \1/g' -Ez \
	| xargs -r -I{} mutt -s "{} at the bone today" -b $(cat emaillist)
cd - > /dev/null
