
reStructuredText
================

	reStructuredText (rst) is a text format that can be easily used to generate professional looking PDF or HTML representations, while still being effortless to view and edit in a text editor. It's a great tool for anyone who wants to write documents as quickly as possible with a lot of flexibility, without needing to navigate the complexities of HTML or Latex, and without being stuck working within a graphical environment to support document editing software.

- `Installing rst2pdf`_
- `Generating a PDF`_
- `Installing rst2html5`_
- `Generating an HTML document`_
- `Text Emphasis`_
- `Creating a Title`_
- `Creating a Link to a Title`_
- `Creating a Hyperlink`_
- `Ordered Lists`_
- `Unordered Lists`_
- `Creating a Paragraph`_
- `Embedding an image`_
- `Embedding a parsed literal`_
- `Embedding a code block`_

Installing rst2pdf
------------------

	rst2pdf is a tool that can generate PDFs from rst files. At the time of this writing, rst2pdf does not support Python 3, so it needs to be installed in a Python 2 environment. To install rst2pdf, create a Python 2 environment, and use **pip** to add it to your system.

.. code:: bash

	$ sudo pip install rst2pdf

Generating a PDF
----------------

	Generating a PDF is a fairly straightforward process, taking the input rst file and producing a nicely formatted PDF file that can be emailed or posted online, and has a more professional look compared to raw rst (text). The command line utility, rst2pdf, takes in two parameters. The first is the input file (formatted as rst), and the second is the desired output location (formatted as a pdf).

.. code:: bash

	$ rst2pdf path/to/document.rst path/to/output.pdf

Installing rst2html5
--------------------

	rst2html5 is a tool that can generate HTML5 documents from rst files. Unlike rst2pdf, at the time of this writing, rst2html5 does support Python 3, so it can be installed in any up to date Python environment. In the example below, I used the **pip3** command, which is the Python 3 version of **pip**. If you prefer to work in Python 2, feel free to simply use **pip**.

.. code:: bash

	$ sudo pip3 install rst2html5

Generating an HTML document
---------------------------

	Generating HTML is as straightforward as generating a PDF. Just like with PDF generation, the command line utility rst2html5 takes two parameters. The first is the input file (formatted as rst), and the second is the output filepath (formatted as HTML).

.. code:: bash

	$ rst2html5 path/to/document.rst path/to/output.html

Text Emphasis
-------------

	There are a number of options for text emphasis in rst, though only bold and italics are included here. Text can be made bold by adding two asterisks on either side of the text you want to make bold.

.. code:: rst

	This is how you make **bold** text.

This is how you make **bold** text.

	Italics are similar, except you only need one asterisk on each side.

.. code:: rst

	This is how you make *italic* text.

This is how you make *italic* text.

Creating a Title
----------------

	In order to structure a document with logical sections and subsections, you can use equals symbols, dashes, and tildes, underlining the line of text you want to make a section or subsection header. Whichever is used first will be the symbol used for making titles in documents, whichever is used second will be the symbol used for making section headers, and whichever is used third will be the symbol for making subsection headers.

.. code:: rst

	Title
	=====

	Introduction text might go here.

	Section Header
	--------------

	Maybe some definitions will go here.

	Subsection Header
	~~~~~~~~~~~~~~~~~

	This could dive into a topic in more depth.

Title
=====

Introduction text might go here.

Section Header
--------------

Maybe some definitions will go here.

Subsection Header
~~~~~~~~~~~~~~~~~

This could dive into a topic in more depth.

Creating a Link to a Title
--------------------------

	In case you want to create a table of contents, or link one part of a document to a different section, you can create links using back ticks and underscores, as shown below.

.. code:: rst

	`Title`_
	`Section Header`_
	`Subsection Header`_

`Title`_
`Section Header`_
`Subsection Header`_

Creating a Hyperlink
--------------------

	Creating hyperlinks is a lot like creating links to sections, with the addition of a hyperlink following the text you want to display, enclosed in less than and greater than symbols.

.. code:: rst

	`Jeremy's Blog <jeremykerr.me/pages/blog/blog.html>`_

`Jeremy's Blog <jeremykerr.me/pages/blog/blog.html>`_

Ordered Lists
-------------

	Ordered lists can be created using a number of sequential options - upper and lowercase letters, numbers, and Roman numerals are a few examples. There may be more.

.. code:: rst

	1. First
	2. Second
	3. Third

	I. First
	II. Second
	III. Third
	
	i. First
	ii. Second
	iii. Third

	A. Aardvark
	B. Banana
	C. Chili

	a. aardvark
	b. banana
	c. chili

1. First
2. Second
3. Third

I. First
II. Second
III. Third

i. First
ii. Second
iii. Third

A. Aardvark
B. Banana
C. Chili

a. aardvark
b. banana
c. chili

Unordered Lists
---------------

	Unordered lists can be created using dashes, plus symbols, and stars. Both ordered and unordered lists can be nested within each other, so you can place an ordered list as a sublist for an unordered list, and vice versa, as well as nesting ordered lists within ordered lists and unordered lists within unordered lists.

.. code:: rst

	- Bullet point 1
	- Bullet point 2
	- Bullet point 3

	- Top bullet point
		+ Nested bullet point 1
		+ Nested bullet point 2

	* Top bullet point
		1. Nested bullet point 1
		2. Nested bullet point 2

- Bullet point 1
- Bullet point 2
- Bullet point 3

- Top bullet point
	+ Nested bullet point 1
	+ Nested bullet point 2

* Top bullet point
	1. Nested bullet point 1
	2. Nested bullet point 2

Creating a Paragraph
--------------------

	In rst, to create a paragraph, all you have to do is indent text. Paragraphs are formatted normally instead of being included as raw text on a page.

.. code:: rst

	Here is some raw text on a page.

		This text is formatted as a paragraph.

Embedding an image
------------------

	Images can be formatted using rst, and optional parameters can be included to define how the image is displayed, if there is alternate text included if the image isn't found or fails to download, and to add any HTML classes that may be useful for connecting to CSS.

.. code:: rst

	.. image:: ../../resources/images/blog-logo.png
		:height: 250px
		:width: 200px
	    :align: center
	    :alt:   blog logo

.. image:: ../../resources/images/blog-logo.png
	:height: 250px
	:width: 200px
    :align: center
    :alt:   blog logo

.. code:: rst

	.. image:: ../../resources/images/logo.png
		:scale: 100%
		:alt: main logo
		:align: center
		:class: example-css-class

.. image:: ../../resources/images/logo.png
	:scale: 100%
	:alt: main logo
	:align: center
	:class: example-css-class

Embedding a parsed literal
--------------------------

	If you have characters that would ordinarily need escaping, or you have something you want included within a nicely formatted block, a parsed literal is a good way to accomplish that.

.. parsed-literal::

    .. parsed-literal::

        This text includes some \\\*\\\*bold\\\*\\\* and \\\*italic\\\* text, but it is not displayed as formatted, because the asterisks are escaped.

.. parsed-literal::

    This text includes some \*\*bold\*\* and \*italic\* text, but it is not displayed as formatted, because the asterisks are escaped.

Embedding a code block
----------------------

	Similar to parsed literals, code blocks are a good way to format code, and depending on the engine you use to create PDF files or HTML files from rst, may cause syntax highlighting that matches what you might expect when you work within an integraded development environment.

.. code:: rst

	.. code:: python

		def foo():
			return "bar"

