#!/bin/bash

CMD="python /acme_email/cli.py"

if [[ -v EMAIL ]]; then
	CMD=$CMD" -e  "$EMAIL
fi

if [[ -v TEST ]]; then
        CMD=$CMD" -t"
fi

if [[ -v DRY_RUN ]]; then
        CMD=$CMD" --dry-run"
fi

if [[ -v NON_INTERACTIVE ]]; then
        CMD=$CMD" --non-interactive"
fi

if [[ -v AGREE_TOS ]]; then
	CMD=$CMD" --agree-tos"
fi

if [[ -v CONTACT ]]; then
        CMD=$CMD" --contact" $CONTACT
fi

if [[ -v IMAP ]]; then
        CMD=$CMD" --imap"
fi

if [[ -v LOGIN ]]; then
        CMD=$CMD" --login "$LOGIN
fi

if [[ -v PASSWORD ]]; then
        CMD=$CMD" --password "$PASSWORD
fi

if [[ -v HOST ]]; then
        CMD=$CMD" --host "$HOST
fi

if [[ -v PORT ]]; then
        CMD=$CMD" --port "$PORT
fi

if [[ -v SSL ]]; then
        CMD=$CMD" --ssl"
fi

if [[ -v SMTP_METHOD ]]; then
        CMD=$CMD" --smtp-method "$SMTP_METHOD
fi

if [[ -v SMTP_LOGIN ]]; then
        CMD=$CMD" --smtp-login "$SMTP_LOGIN
fi

if [[ -v SMTP_PASSWORD ]]; then
        CMD=$CMD" --smtp-password "$SMTP_PASSWORD
fi

if [[ -v SMTP_HOST ]]; then
        CMD=$CMD" --smtp-host "$SMTP_HOST
fi

if [[ -v SMTP_PORT ]]; then
        CMD=$CMD" --smtp-port "$SMTP_PORT
fi

if [[ -v NO_PASSPHRASE ]]; then
        CMD=$CMD" --no-passphrase"
fi

if [[ -v PASSPHRASE ]]; then
        CMD=$CMD" --passphrase "$PASSPHRASE
fi

if [[ -v USAGE ]]; then
        CMD=$CMD" --usage "$USAGE
fi

if [[ -v CERT_PATH ]]; then
        CMD=$CMD" --cert-path "$CERT_PATH
fi

if [[ -v REASON ]]; then
        CMD=$CMD" --reason "$REASON
fi

if [[ -v KEY_PATH ]]; then
        CMD=$CMD" --key-path "$KEY_PATH
fi

if [[ -v OUTLOOK ]]; then
        CMD=$CMD" --outlook"
fi

if [[ -v OUTLOOK_ACCOUNT ]]; then
        CMD=$CMD" --outlook-account "$OUTLOOK_ACCOUNT
fi

if [[ -v TB ]]; then
        CMD=$CMD" --tb"
fi

if [[ -v TB_UNSAFE ]]; then
        CMD=$CMD" --tb-unsafe"
fi

if [[ -v TB_PROFILE ]]; then
        CMD=$CMD" --tb-profile "$TB_PROFILE
fi

if [[ -v TB_BIN ]]; then
        CMD=$CMD" --tb-bin "$TB_BIN
fi

if [[ -v COMMAND ]]; then
        CMD=$CMD" "$COMMAND
fi

$CMD
