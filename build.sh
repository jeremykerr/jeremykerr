#!/bin/bash


function createIndex {
    echo "Building index.rst"

    rst2html5 --template ./source/templates/index-template.html \
        ./source/index.rst > ./index.html

    return 0;
}

function createAbout {
    echo "Building about.rst"

    rst2html5 --template ./source/templates/about-template.html \
        ./source/pages/about.rst > ./pages/about.html

    return 0;
}

function create404 {
    echo "Building error-404.rst"

    rst2html5 --template ./source/templates/error-404.html \
        ./source/error-404.rst > ./404.html

    return 0;
}

function createBlog {
    echo "Building blog.rst"

    rst2html5 --template ./source/templates/blog-template.html \
        ./source/pages/blog.rst > ./pages/blog.html

    return 0;
}

function createPages {
    for file in `find source/pages/ -name '*.rst'`;
    do
        echo "Building ${file}"
        local FULL_DIRECTORY=`dirname ${file}`
        local DIRECTORY=`echo ${FULL_DIRECTORY} | cut -d'/' -f2-`
        local FILENAME=`basename ${file}`
        if [ "$FILENAME" == "about.rst" ]; then
            continue
        fi
        if [ "$FILENAME" == "blog.rst" ]; then
            continue
        fi
        echo "Making ${DIRECTORY} if necessary"
        mkdir -p ./${DIRECTORY}

        rst2html5 --template ./source/templates/default-template.html \
                  ${file} \
                  > ${DIRECTORY}/${FILENAME%.*}.html
    done
    if [ $? != 0 ]; then return 1; fi

    return 0;
}

function copyResources {
    echo "Copying static resources"
    cp -R ./source/resources/* ./resources/
    if [ $? != 0 ]; then return 1; fi

    return 0;
}

function main {
    createIndex;
    if [ $? != 0 ]; then return 1; fi

    createAbout;
    if [ $? != 0 ]; then return 1; fi

    create404;
    if [ $? != 0 ]; then return 1; fi

    createBlog;
    if [ $? != 0 ]; then return 1; fi
    
    createPages;
    if [ $? != 0 ]; then return 1; fi

    copyResources;
    if [ $? != 0 ]; then return 1; fi

    return 0;
}


if [ "${1}" != "--no-execute" ]; then
    # --------------------------------------------------
    # Run main function, unless this script was imported 
    # into another script with the "no execute" flag
    # This script should be run with "sudo"
    # --------------------------------------------------
    main "${@}"
fi


