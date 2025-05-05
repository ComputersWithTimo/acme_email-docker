#acme-email-docker
Simple Dockerfile for acme_email
https://github.com/polhenarejos/acme_email

## Build
Building this dockerfile is as simple as cloning this repository and building it with either docker or buildah:

```
git clone https://github.com/ComputersWithTimo/acme_email-docker.git
cd acme_email-docker


buildah -t acme_email-docker build Dockerfile

or

docker -t acme_email-docker build
```


##Usage

You can run the container with the following environment variables:

| Variable | Usage |
| -------- | ----- |
| -e EMAIL=foo@bar.co    | E-mail address to certify |
| -e TEST=yes     | Tests the certification from a staging server |
| -e DRY_RUN=yes  | Do not store any file. For testing |
| -e NON_INTERACTIVE=yes | Runs the certification without any user interaction |
| -e AGREE_TOS=yes | Accepts Terms of Service |
| -e CONTACT=xxx | Contact e-mail for important account notifications |
| -e IMAP=yes | Uses IMAP Authenticator for automatic reply |
| -e LOGIN=foo@bar.co | IMAP login |
| -e PASSWORD=foobar | IMAP password |
| -e HOST=imap.foo.bar | IMAP server host |
| -e PORT=993 | IMAP server port. If empty, it will be auto-detected |
| -e SSL=yes | IMAP SSL connection |
| -e SMTP_METHOD={STARTTLS,SSL,plain} | SMTP method {STARTTLS,SSL,plain} |
| -e SMTP_LOGIN=foo@bar.co | SMTP login. If empty, IMAP login will be used |
| -e SMTP_PASSWORD=foobar | SMTP password. If empty, IMAP password will be used |
| -e SMTP_HOST=smtp.foo.bar | SMTP server host |
| -e SMTP_PORT=445 | SMTP server port. If empty, it will be auto-detected |
| -e NO_PASSPHRASE=yes | PKCS12 is stored without passphrase. Use with CAUTION: the PKCS12 contains the private key |
| -e PASSPHRASE=asdf | Passphrase to use for the PKCS12 generation. This passpharse will be used for private key encryption |
| -e USAGE={digitalSignature,contentCommitment,keyEncipherment,keyAgreement} | Key usage for certificate. Multiple usages can be specified |
| -e CERT_PATH=/data/foo | Path where certificate is located |
| -e REASON={unspecified,keycompromise,affiliationchanged,superseded,cessationofoperation} | Reason of revocation |
| -e KEY_PATH=/data/bar | Path of private key location |
| -e OUTLOOK=yes | Uses MAPI (Outlook) Authenticator for automatic reply !NOT TESTED! |
| -e OUTLOOK_ACCOUNT=asdf | Outlook account where the challenge is processed !NOT TESTED! |
| -e TB=yes | Uses Thunderbird Authenticator for automatic reply !NOT TESTED! |
| -e TB_UNSAFE=yes | Run authenticator disabling security checks. USE WITH CAUTION. !NOT TESTED! |
| -e TB_PROFILE=asdf | Thunderbird profile where it runs !NOT TESTED! |
| -e TB_BIN=/usr/share/thunderbird | Thunderbird binary/executable path !NOT TESTED! |
| -e COMMAND={cert,revoke,renew} | Cert = Request new Cert. Revoke = Revoke certificate. Renew = Renew the Certificate |


Data will be saved to /etc/letsencrypt.
So you should mount a docker volume here.

For example:

```
docker run --rm -it \
-v /data:/etc/letsencrypt \
-e EMAIL=foo@bar.co \
-e AGREE_TOS=yes \
-e IMAP=yes \
-e LOGIN=foo@bar.co \
-e PASSWORD=foobar \
-e HOST=imap.foo.bar \
-e SMTP_METHOD=STARTTLS \
-e SMTP_HOST=smtp.foo.bar \
-e PASSPHRASE=asdf \
-e COMMAND=cert \
acme_email-docker
