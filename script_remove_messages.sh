#!/bin/bash
#########################################################
#							                                          #
#	      Delete old messages from Zimbra's Accounts      #
#							                                          #
#########################################################
#							                                          #
#         		By: Felipe Maeda - Inova                  #
#							                                          #
#########################################################

# Vars
ACCOUNT=$1
FOLDER=$2
BEFORE_DATE=$3
QUANT=$4

# Usage
Usage(){

cat << EOF

Delete old messages from Zimbra's accounts.
 
Usage:

bash script_delete_old_messages.sh ACCOUNT FOLDER BEFORE_DATE QUANTITY(1-1000)

Example:

bash script_delete_old_messages.sh account.name@domain.com INBOX 04/28/2000 1000

EOF

}

# Verify Variables
if [[ -z ${ACCOUNT} ]] || [[ -z ${FOLDER} ]] || [[ -z ${BEFORE_DATE} ]]; then
   Usage;
   exit 2;
fi;

# Delete messages
touch /tmp/deleteMessages.txt;
for message_id in $(/opt/zimbra/bin/zmmailbox -z -m $ACCOUNT search -l $QUANT "in:/$FOLDER (before:$BEFORE_DATE)" | grep conv | awk '{ print $2 }' | egrep "[0-9]"); do
	if [[ $message_id =~ [-]{1} ]]; then
		echo "deleteMessage $(echo $message_id | cut -d\- -f2)" >> /tmp/deleteMessages.txt;
	else
		echo "deleteConversation $message_id" >> /tmp/deleteMessages.txt; 
	fi;
done;

echo "Foram localizados $(wc -l /tmp/deleteMessages.txt | awk '{ print $1 }') Mensagens. Deseja prosseguir com a exclusão? [ sim / nao ]"
read DEC

if [ $DEC == "sim" ]; then
	/opt/zimbra/bin/zmmailbox -z -m $ACCOUNT < /tmp/deleteMessages.txt;
fi
rm -f /tmp/deleteMessages.txt;

# Remove the file if the process end
trap "rm -f /tmp/deleteMessages.txt" EXIT;
