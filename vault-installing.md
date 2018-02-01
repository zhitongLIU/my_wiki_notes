= Vault =
== Installing Vault server ==
=== Configuration ===
create file /etc/vault.conf
{{{
touch /etc/vault.conf
}}}

content:
{{{
backend "file" {
  path = "vault"
}

listener "tcp" {
  address = "127.0.0.1:8200"
  tls_disable = 1
}

disable_mlock = true
}}}

if wanna use ssl please read: [[https://www.vaultproject.io/docs/config/index.html#tls_disable]] <br>

=== Initial ==

run
{{{
vault init -address='http://127.0.0.1:8200'
}}}

and save that keys in a file 'keys_file'<br>

now you should be able to see a file here ~/vault <br>

run three time the following commands with 3 different unseal key from that 'keys_file' to unseal the vault
{{{
vault unseal -address='http://127.0.0.1:8200'
}}

