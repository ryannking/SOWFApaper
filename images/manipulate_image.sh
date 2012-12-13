#!/bin/bash

for file in `ls unstable*.png`
do
   newname=`echo $file | sed 's/\.png$//g'`

   ./png2eps.sh $file > ${newname}.eps
   epstopdf ${newname}.eps

   echo %% ${newname} %% >> image_file
   echo '\begin{figure}' >> image_file
   echo '\centering' >> image_file
   echo \\includegraphics[width=\\textwidth]{images/${newname}} >> image_file
   echo '\caption{INSERT_CAPTION}' >> image_file
   echo \\label{fig:${newname}} >> image_file
   echo '\end{figure}' >> image_file
   echo '' >> image_file
   echo '' >> image_file
done



