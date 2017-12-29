#!/usr/bin/expect -f
spawn ssh-keygen -t rsa -b 2048
expect "(/root/.ssh/id_rsa):"
send "\r"
expect "(empty for no passphrase):"
send "\r"
expect "again:"
send "\r"
expect "/root/.ssh/id_rsa."
send "\r"
expect "/root/.ssh/id_rsa.pub."
send "\r"
expect "The key fingerprint is:"
send "\r"
expect "+-----------------+"
send "\r"
interact
