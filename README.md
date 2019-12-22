# dteplov182_infra
dteplov182 Infra repository
# Tips and Tricks
## Общие
```bash
git push -f --set-upstream origin play-travis
```
**-f, --force**  Usually, the command refuses to update a remote ref that is not an ancestor of the local ref used to overwrite it. This flag disables the check.
## ДЗ 3
Команда для прыжка через бастион во внутренную машину с передачей ключа:
```bash
ssh -t -i <KEYFILE> -A <BASTION_USER>@<BASTION_IP> 'ssh <INTERNAL_IP>'
```
**-t**      Force pseudo-tty allocation.
**-i** identity_file
**-A**      Enables forwarding of the authentication agent connection.  This can also be specified on a per-host basis in a configuration file.
**Либо можно использовать ключ** **-J**
Настроим SSH для подключеня сразу к внутренней машине используя алиасы ssh:
```bash
cat ~/.ssh/config
Host bastion
	Hostname <BASTION_IP>
	User <BASTION_IP>
	IdentityFile <KEYFILE>
	ForwardAgent yes
Host someinternalhost
	Hostname <INTERNAL_IP>
	User <INTERNAL_USER>
	ProxyJump bastion
```

Добавление сертификата я не стал делать, т.к. предложенные ресурсы испытывают проблемы с выдачей сертификатов:
*Error creating new order :: too many certificates already issued for: sslip.io: see https://letsencrypt.org/docs/rate-limits/"*
Да и задача получения с LetsEncrypt весьма простая и не вызывает проблем на пет проектах

Для тестов необходимы эти данные
bastion_IP = 35.210.141.81
someinternalhost_IP = 35.210.141.81
