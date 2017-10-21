

# JeremyKerr.me

This is a site for blogging and notes. All pages are built using rst, and converted to HTML5 using rst2html5, using custom templates. It utilizes Bootstrap for styling, JQuery for dynamic page behavior, and is designed to look spiffy in a mobile or desktop environment with minimal effort. There is a build script that will convert all the pages to HTML5, move images and other resources to the correct place, and apply any templates that are specified.

## Structure

/.git
/css
/fonts
/includes
/js
/pages
/resources
/source

## Updating CSS

Changes to the CSS should be made in **/css/jeremykerr.css**. This file extends Bootstrap, but by keeping changes in this file upgrading to a different version of bootstrap down the road will be much easier.

## Including images and resources

Images and resources should be saved to **/pages/resources**. They are moved over to the web-browsable location by the build script.

## To run

It's easiest to run this locally to test any changes before trying to view it in production. This is because it takes a little while (maybe 15 seconds, usually) before Github updates the pages, and it takes longer to invalidate the CloudFront cache (several hours, unless you log in and manually invalidate the cache).

To run locally, open a bash terminal and just use a python HTTP server. The page is fully static, so it should work exactly the same this way as it does in production.

```bash

/path/to/jeremykerr/ $ python -m SimpleHTTPServer 8000

```


