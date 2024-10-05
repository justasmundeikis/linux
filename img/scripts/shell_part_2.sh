#!/bin/bash

# Check for the directory and remove it if it exists
if [ -d ~/shell_part_2 ]; then 
  rm -r ~/shell_part_2 
fi

# Create the necessary directories
mkdir -p ~/shell_part_2/data || { echo "Failed to create data directory"; exit 1; }
mkdir -p ~/shell_part_2/text || { echo "Failed to create text directory"; exit 1; }
mkdir -p ~/shell_part_2/mix || { echo "Failed to create mix directory"; exit 1; }

# Fetch weather data for each city and store it in respective files
curl -s https://api.meteo.lt/v1/places/vilnius/forecasts/long-term | jq -r ".forecastTimestamps[] | \"\(.forecastTimeUtc)\t\(.airTemperature)\" " > ~/shell_part_2/data/temp_vilnius.txt || { echo "Failed to fetch Vilnius data"; exit 1; }
curl -s https://api.meteo.lt/v1/places/kaunas/forecasts/long-term | jq -r ".forecastTimestamps[] | \"\(.forecastTimeUtc)\t\(.airTemperature)\" " > ~/shell_part_2/data/temp_kaunas.txt || { echo "Failed to fetch Kaunas data"; exit 1; }
curl -s https://api.meteo.lt/v1/places/klaipeda/forecasts/long-term | jq -r ".forecastTimestamps[] | \"\(.forecastTimeUtc)\t\(.airTemperature)\" " > ~/shell_part_2/data/temp_klaipeda.txt || { echo "Failed to fetch Klaipeda data"; exit 1; }

# Write the text to the file
echo -e "Apšerkšniję mūsų žiemos –\nBalta, balta – kur dairais –\nIlgas pasakas mažiemus\nSeka pirkioj vakarais.\n\nApie klaidžią sniego pūgą,\nSaulės nukirptas kasas –\nApie žąsiną moliūgą,\nKur išskrido į dausas.\n\nApie vilką, baltą mešką,\nBurtus, išdaigas velnių,\nApie vandenis, kur teška\nIš sidabro šulinių.\n\nApie trečią brolį Joną –\nKoks jis raitelis puikus.\nApie Eglę – žalčio žmoną,\nMedžiais paverstus vaikus.\n\nKaip našlaitė nusiminus\nGrįžo tuščiomis atgal...\nBrenda pušys per pusnynus\nIr išbrist niekaip negal! –\n\nPusnynuos nykštukai miega,\nAukso žuvys po ledu –\nBėga ragana per sniegą,\nNepalikdama pėdų.\n\nNašlaitėlė gero būdo –\nO jos pamotė pikta...\nBet...senelė užusnūdo.\nIr jos pasaka baigta." > ~/shell_part_2/text/seneles_pasaka.txt || { echo "Failed to write to text file"; exit 1; }

# Final success message
echo "Sveikinu, visi reikalingi failai sukurti!"

