#!/bin/bash
if [ -e Glycam06_alldocs.txt ] ; then
	rm Glycam06_alldocs.txt
fi
for i in $(/bin/ls -1r Parm_Docs/*.txt) ; do 
	echo "
File:  $i ===================================
"  >> Glycam06_alldocs.txt 
	cat $i >> Glycam06_alldocs.txt
done

