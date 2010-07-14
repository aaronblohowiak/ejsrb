# EJSRB

## There are two reasons to use EJSRB:

  1. Re-use your views on the server and in the browser, without learning a new language or giving up SEO.
  2. Perfect separation between your controller and your view.
  
## Re-use

  Do your actions respond to ajax requests with html? What if you need to call the same action from different pages, and want to format the results differently?  What if you want to optimistically update the UI without waiting for an AJAX response?  What if you want to enable your application offline?
  
  Here's stuff I've tried:
    duplicating views - 2x the pain, there are always regressions and forgetting to update the stuff in two places.
    copying an existing element and replacing the content - brittle, more work than duplicating views
    adding flags to the xhr, 
    
## Install

sudo gem update --system
sudo gem install bundler
git clone git://github.com/aaronblohowiak/ejsrb.git
cd ejsrb
sudo bundler install