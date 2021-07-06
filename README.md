# ZCS-remove-messages
Script for removing messages from Zimbra accounts.

### Instalation:

Clone this repo and create alias command.

```sh
git clone https://github.com/FelipeMaeda/ZCS-remove-messages.git
mv ./script_remove_messages.sh /usr/bin/
chmod a+x /usr/bin/script_remove_messages.sh
```
### Usage:

Run this script passing the account, folder, date and the number of messages to be deleted (1 - date

```sh
/usr/bin/./script_remove_messages.sh <account> <folder> <date> <quantity> 
``` 
### Example:

```sh
/usr/bin/./script_remove_messages.sh mmartins@trt24.jus.br Inbox 02/07/2021 100
```
