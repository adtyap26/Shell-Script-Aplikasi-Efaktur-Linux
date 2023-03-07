#!/bin/bash
file_konfig="ETaxInvoiceMain.config"
file_temp="${file_konfig}.temp"


echo -e "######################################################################## "                                                                
echo "         _____ _             ___                 _ "                 
echo " __/\__ | ____| |_ __ ___  _|_ _|_ ____   _____ (_) ___ ___  __/\__ "
echo " \    / |  _| | __/ _  \ \/ /| || '_ \ \ / / _ \| |/ __/ _ \ \    / "
echo " /_  _\ | |___| || (_| |>  < | || | | \ V / (_) | | (_|  __/ /_  _\ "
echo "   \/   |_____|\__\__,_/_/\_\___|_| |_|\_/ \___/|_|\___\___|   \/   "

echo -e ""

echo -e "Masukkan $(gum style --bold --foreground 99 'memory') maksimum dalam megabytes (biarkan kosong untuk auto set): "
# mem_maks=$(gum input) 
IFS= read -r mem_maks < <(gum input --placeholder 500)
sleep 2 

if [[ -z "$mem_maks" ]]; then
  gum style \
	--foreground 212 --border-foreground 212 --border double \
	--align center --width 50 --margin "0 0" --padding "0 0" \
	'Melewatkan konfigurasi memory...'
  gum spin --spinner dot --title "Please wait..." -- sleep 2
  else
    echo "Menyetel memory maksimum ke ${mem_maks} megabytes..." | gum style \
	--foreground 212 --border-foreground 212 --border double \
	--align center --width 50 --margin "0 0" --padding "0 0"
    sed "/^option -Xmx/d; /^option -Xms/d" "$file_konfig" > "$file_temp"
    echo "option -Xmx${mem_maks}m" >> "$file_temp"
    echo "option -Xms${mem_maks}m" >> "$file_temp"
    mv "$file_temp" "$file_konfig"
fi

 gum spin --spinner dot --title "Please wait..." -- sleep 2
 echo -n "Apakah Anda ingin menjalankan aplikasi ETaxInvoice? [Y/n] "

 if gum confirm ; then
  gum spin --spinner dot --title "Opening the apps..." -- sleep 3
  ./ETaxInvoice 
 fi

 sleep 1
 gum style --bold --foreground 123  'Terimakasih Telah Menggunakan Layanan Kami 🙏'
 echo -e "Kunjungi situs $(gum style --bold --foreground 99 'https://www.pajak.go.id')  Untuk Informasi Seputar Pajak"                                                               
