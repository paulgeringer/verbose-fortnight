## Ruby

The ruby code is fairly straightforward. Simply run:

```
./user_add <USER>
./list_users
./delete_user <USER>
```

on a Linux VM.

## Puppet

The puppet code is slightly more complex, but it can be run with:

```
FACTER_username=<USER> puppet apply puppet/manifests/init.pp
```

Just note that this creates and deletes the user all at once.
Finally, you would have to "specify" the pubkey file by placing it in the `files` directory within the `puppet` directory.
