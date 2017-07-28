#!/bin/bash
#Script Perpanjang User SSH
read -p "Username : " Login
read -p "Penambahan Masa Aktif (hari): " masaaktif
mati="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"

chage -E `date -d "$mati +$masaaktif days" +"%Y-%m-%d"` $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
passwd -u $Login
echo -e "--------------------------------"
echo -e "Akun Sudah Diperpanjang Hingga $exp"
echo -e "==========================="
echo -e "Script  By EndyDjubu"
