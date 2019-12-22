# dteplov182_infra
dteplov182 Infra repository



# Tips and Tricks
## Общие
    git push -f --set-upstream origin play-travis
**-f, --force**  Usually, the command refuses to update a remote ref that is not an ancestor of the local ref used to overwrite it. This flag disables the check.
## ДЗ 3
Команда для прыжка через бастион во внутренную машину с передачей ключа.

    ssh -t -i <KEYFILE> -A <BASTION_USER>@<BASTION_IP> 'ssh <INTERNAL_IP>'
**-t**      Force pseudo-tty allocation.
**-i** identity_file
**-A**      Enables forwarding of the authentication agent connection.  This can also be specified on a per-host basis in a configuration file.
Настроим SSH для подключеня сразу к внутренней машине используя алиасы ssh:
**cat ~/.ssh/config**

Host bastion
	Hostname <BASTION_IP>
	User <BASTION_IP>
	IdentityFile <KEYFILE>
	ForwardAgent yes
Host someinternalhost
        Hostname <INTERNAL_IP>
        User <INTERNAL_USER>
	ProxyJump bastion
