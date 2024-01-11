#!/bin/bash
echo "    1    1    2" > /usr/local/programs/glycam06/prep_files/Glycam_06.prep_new
echo "Carbohydrates_04.dat" >> /usr/local/programs/glycam06/prep_files/Glycam_06.prep_new
for i in /usr/local/programs/glycam06/prep_files/indiv_prep_files/*.prep ; do 
sed '1,2d' < $i >> /usr/local/programs/glycam06/prep_files/Glycam_06.prep_new
sed '/^STOP.*$/d' < /usr/local/programs/glycam06/prep_files/Glycam_06.prep_new > /usr/local/programs/glycam06/prep_files/Glycam_06.prep
done
echo "STOP" >>/usr/local/programs/glycam06/prep_files/Glycam_06.prep
rm /usr/local/programs/glycam06/prep_files/Glycam_06.prep_new 
