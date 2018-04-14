#!/bin/bash
rm -r Gaydar

git clone https://github.com/EmberVulpix/Gaydar

cd Gaydar

PS3="Which map do you want to use? "
options=("4k Map" "8k Map")
select opt in "${options[@]}"
do
    case $opt in
        "4k Map")
            echo "Using 4k Map"
            if [ -e src/main/resources/maps/Erangel4k.png ]
            then
              mv src/main/resources/maps/Erangel_Minimap.png src/main/resources/maps/Erangel8k.png
              mv src/main/resources/maps/Miramar_Minimap.png src/main/resources/maps/Miramar8k.png
              mv src/main/resources/maps/Erangel4k.png src/main/resources/maps/Erangel_Minimap.png
              mv src/main/resources/maps/Miramar4k.png src/main/resources/maps/Miramar_Minimap.png
            fi
            break
            ;;
        "8k Map")
            echo "Using 8k Map"
            if [ -e src/main/resources/maps/Erangel8k.png ]
            then
              mv src/main/resources/maps/Erangel_Minimap.png src/main/resources/maps/Erangel4k.png
              mv src/main/resources/maps/Miramar_Minimap.png src/main/resources/maps/Miramar4k.png
              mv src/main/resources/maps/Erangel8k.png src/main/resources/maps/Erangel_Minimap.png
              mv src/main/resources/maps/Miramar8k.png src/main/resources/maps/Miramar_Minimap.png
            fi
            break
            ;;
        *) echo invalid option;;
    esac
done

mvn -T 1C clean verify install

cd ..

if [ -e run.sh ]
then
  echo "Keep previous run.sh [Y/N]? "
  read keep
  if [ "$keep" != "${keep#[Yy]}" ]
  then
    exit
  fi
fi

wget https://raw.githubusercontent.com/zecjy/PUBG_radar_setup/master/create_run.sh -O create_run.sh
chmod +x create_run.sh
./create_run.sh
