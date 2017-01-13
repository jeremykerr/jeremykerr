#!/bin/bash

# Create the index file and move it to it's correct location
echo "index.rst"
rst2html5 --template templates/index-template.html \
          index.rst \
          > ../index.html

# Create the other pages and move them to their relative directories
for file in `find pages/ -name '*.rst'`;
do
	echo ${file}
	DIRECTORY=`dirname ${file}`
	FILENAME=`basename ${file}`

	mkdir -p ../${DIRECTORY}

	rst2html5 --template templates/default-template.html \
              ./${file} \
              > ../${DIRECTORY}/${FILENAME%.*}.html
done

# Copy resources out into the parent resources directory
cp -R resources/* ../resources/


