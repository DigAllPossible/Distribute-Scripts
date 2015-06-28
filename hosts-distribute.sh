#!/bin/bash
# 
. /etc/init.d/functions
user=distribute
localfile=/home/distribute/hosts
port=22
remotepath=/etc/
for ip in {172.16.1.101,172.16.1.10,172.16.1.20,172.16.1.110,172.16.1.200}
 do
  scp -P $port $localfile $user@$ip:~ &>/dev/null &&\
  ssh -t $user@$ip sudo /bin/cp $localfile $remotepath &>/dev/null
if [[ "$?" == "0" ]]
 then
  action "$ip Distributed success!" /bin/true ;
 else
  action "$ip Distributed false!!!" /bin/false;
fi
done
