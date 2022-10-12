!/usr/bin/bash -l

#download csv file  ( i did the github clone instead)

curl  https://gis.data.cnra.ca.gov/datasets/CALFIRE-Forestry::recent-large-fire-perimeters-5000-acres.csv > calfires_2021.csv
git clone https://github.com/biodataprog/2022_hw2-melissa-gomez

#print out the range of years that occur in this file (hint cut out the column you want, sort and get either the smallest or largest number
cut -d, -f2 calfires_2021.csv | sort -n

#print out the number of fires in the database
cut -d, -f2 calfires_2021.csv | sort -g | wc -l

#remove header
cut -d, -f2 calfires_2021.csv | sort -g | tail -n +2 | wc -l

#Print out the number of fires that occur each year
cut -d, -f2 calfires_2021.csv | sort -g | uniq -c
cut -d, -f2 calfires_2021.csv | sort -g | tail -n +2 | wc -l


#Print out the name largest fire
awk -F, '{print $13,$2,$6}' calfires_2021.csv | sort -n | tail -n 1

#Print out the total acreage burned in each year

for YEAR in 2017 2018 2019 2020 2021
   do
      TOTAL=$(grep $YEAR calfires_2021.csv | awk -F',' '{sum+=$13;} END{print sum;}')
      echo "In Year $YEAR, Total was $TOTAL"
   done
