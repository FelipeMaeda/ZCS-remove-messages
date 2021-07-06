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

Run this script passing the account, folder, date and the number of messages to be deleted (max 1000). The search will be performed based on the date, that is, if you enter the date "01/01/2020" with the quantity 100, the first 100 messages prior to this date will be searched.

```sh
/usr/bin/./script_remove_messages.sh <account> <folder> <date> <quantity> 
``` 
### Example:

```sh
/usr/bin/./script_remove_messages.sh account@domain.com Inbox 02/25/2021 100
```
