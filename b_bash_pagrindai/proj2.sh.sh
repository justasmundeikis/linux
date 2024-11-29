echo -e "SKAICIUS\tDATA\tVIETA" | cat - <(
    curl -s 'https://get.data.gov.lt/datasets/gov/radiologija/SeskinesPoliklinika?select(tyrimo_studijos_data,paciento_lytis,paciento_svoris,paciento_ugis,tirta_kuno_dalis,tyrimo_serijos_modalumas)&tyrimo_studijos_data>="2024-11-01"&sort(tyrimo_studijos_data,paciento_lytis)' | 
     jq -r '._data[] | select(.tyrimo_studijos_data == "2024-11-28") | [.tyrimo_studijos_data, .tirta_kuno_dalis] | @tsv' | sort |  uniq -c | sed 's/^\s*//g' | sed 's/\s/\t/g'   |sort -t $'\t' -k2,2 -r | head -n 20 | sort -t $'\t' -k3,3 
    ) | column -t -s $'\t' 
