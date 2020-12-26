### About opendkim
Read more [here](https://blog.gelin.ru/2016/11/blog-post.html)

Server-sender signs mails using domainkey.pem (private rsa key),
server-receiver verifies the authenticity of the signature using public key which is in TXT DNS record

### Pay attention
All steps below can be needed you only if you want to reconfigure DKIM. 
In other cases, you should not change this configuration.

### How to get private and public keys

* Generate private key 
```bash
$ openssl genrsa -out domainkey.pem 1024
```
* Extract public part from got key
```bash
$ openssl rsa -in domainkey.pem -out domainkey-public.pem -pubout -outform PEM
```

### What to do with public key
Insert the key to TXT record of DNS
```
<some selector>._domainkey.your.domain 300 IN	TXT	"v=DKIM1;k=rsa;p=your-public-rsa-key;"
```

### SPF, DKIM and DMARK
As a result you should add three TXT DNS records:

* SPF
```bash
your.domain.  300 IN TXT "v=spf1 a mx ip4:your.host.ip.address ~all"
```

* DKIM
```bash
mail._domainkey.your.domain. 300 IN	TXT	"v=DKIM1;k=rsa;p=your-public-rsa-key;"
```

* DMARC
```bash
_dmarc.your.domain.	300	IN TXT "v=DMARC1;p=none;pct=100;rua=mailto:admin@your.domain"
```
