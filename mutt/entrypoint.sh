#!/bin/bash
set -e

if [[ -z "$EMAIL" ]]; then
	echo >&2 'error: missing EMAIL environment variable'
	echo >&2 '  try running again with -e EMAIL=your-email@gmail.com'
	echo >&2 '    optionally, you can also specify -e EMAIL_PASS'
	echo >&2 '    -e EMAIL_USER="Your Name" and EMAIL_FROM=email@your-domain.com'
	echo >&2 '      if not specified, both default to the value of EMAIL'
	exit 1
fi

if [[ -z "$EMAIL_USER" ]]; then
	EMAIL_USER="$EMAIL"
	echo >&2 'warning: missing EMAIL_USER environment variable'
fi

if [[ -z "$EMAIL_FROM" ]]; then
	EMAIL_FROM="$EMAIL"
	echo >&2 'warning: missing EMAIL_FROM environment variable'
fi

if [[ -z "$IMAP_SERVER" ]]; then
	echo >&2 'error: missing IMAP_SERVER environment variable'
fi

if [[ -z "$SMTP_SERVER" ]]; then
	echo >&2 'error: missing SMTP_SERVER environment variable'
fi

sed -i "s/%EMAIL_LOGIN%/$EMAIL_USER/g"       "$HOME/.mutt/muttrc"
sed -i "s/%EMAIL_USER%/$EMAIL_USER/g"   "$HOME/.mutt/muttrc"
sed -i "s/%EMAIL_PASS%/$EMAIL_PASS/g"   "$HOME/.mutt/muttrc"
sed -i "s/%EMAIL_FROM%/$EMAIL_FROM/g"   "$HOME/.mutt/muttrc"
sed -i "s/%IMAP_SERVER%/$IMAP_SERVER/g" "$HOME/.mutt/muttrc"
sed -i "s/%SMTP_SERVER%/$SMTP_SERVER/g" "$HOME/.mutt/muttrc"

head -15 "$HOME/.mutt/muttrc"

if [[ -d "$HOME/.gnupg" ]]; then
	# sane gpg settings to be a good encryption
	# social citizen of the world
	{
		echo
		echo 'source /usr/share/doc/mutt/examples/gpg.rc'
		if [[ ! -z "$GPG_ID" ]]; then
			echo "set pgp_sign_as = $GPG_ID"
		fi
		echo 'set crypt_replysign=yes'
		echo 'set crypt_replysignencrypted=yes'
		echo 'set crypt_verify_sig=yes'
		# auto encrypt replies to encrypted mail
		echo 'set pgp_replyencrypt=yes'
		# auto sign replies to signed mail
		echo 'set pgp_replysign=yes'
		# auto sign & encrypt to signed & encrypted mail
		echo 'set pgp_replysignencrypted=yes'
		# show which keys are no good anymore
		echo 'set pgp_show_unusable=no'
		# auto sign emails
		echo 'set pgp_autosign=yes'
	} >> "$HOME/.mutt/muttrc"
fi

if [[ -e "$HOME/.muttrc.local" ]]; then
	echo "source $HOME/.muttrc.local" >> "$HOME/.mutt/muttrc"
fi

exec "$@"
