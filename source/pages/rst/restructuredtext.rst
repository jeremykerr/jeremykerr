
reStructuredText
================

- `Installing rst2pdf`_
- `Generating a PDF`_
- `Installing rst2html5`_
- `Generating an HTML document`_
- `Creating a Title`_
- `Creating a Link to a Title`_
- `Creating a Hyperlink`_
- `Ordered Lists`_
- `Unordered Lists`_
- `Creating a Paragraph`_
- `Embedding an image`_
- `Embedding a code block`_

Installing rst2pdf
------------------

	*At the time this was written, rst2pdf does not support Python3, so you need to install it in a Python2 environment.*

.. code:: bash

	sudo pip install rst2pdf

Generating a PDF
----------------

.. code:: bash

	$ rst2pdf path/to/document.rst path/to/output.pdf

Installing rst2html5
--------------------

	*Note that for rst2html5, you can install using Python3, so that's what I used.*

.. code:: bash

	sudo pip3 install rst2html5

Generating an HTML document
---------------------------

.. code:: bash

	rst2html5 path/to/document.rst path/to/output.html

Creating a Title
----------------

.. code:: rst

	Title
	=====

	Subtitle 1
	----------

	Subtitle 2
	~~~~~~~~~~

Creating a Link to a Title
--------------------------

.. code:: rst

	`Title`_
	`Subtitle 1`_
	`Subtitle 2`_

Creating a Hyperlink
--------------------

.. code:: rst

	`Label <hyperlink.html>`_

Ordered Lists
-------------

.. code:: rst

	1. First
	2. Second
	3. Third

	I. First
	II. Second
	III. Third.
	
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

.. code:: rst

	- Bullet
	+ Bullet
	* Bullet

Creating a Paragraph
--------------------

.. code:: rst

	This is not a paragraph.

		This is a paragraph. *Italics*. **Bold**.

Embedding an image
------------------

.. code:: rst

	.. image:: path/to/img.jpg
		:height: 100px
		:width:  100px
        :scale:  100%
		:alt:    alternate text
		:align:  center

Embedding a parsed literal
--------------------------

	*This is useful when you need to use escape characters.*

.. parsed-literal::

	Text exists, may include characters that need escaping

Embedding a code block
----------------------

.. code:: rst

	.. code:: python

		def foo():
			return "bar"

