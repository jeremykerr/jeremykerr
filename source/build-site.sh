#!/bin/bash

# Create the index file and move it to it's correct location
echo "index.rst"
rst2html5 --template templates/index-template.html \
          index.rst \
          > ../index.html

# Create the other pages and move them to their relative directories
for f in pages/*.rst;
do
	echo ${f}
	FILENAME=`basename ${f}`
	rst2html5 --template templates/default-template.html \
              ${f} \
              > ../pages/${FILENAME%.*}.html
done

# Copy resources out into the parent resources directory
cp -R resources/* ../resources/


