# LivePage Landing Site

This is is used to drive traffic towards the LivePage chrome store webpage https://chrome.google.com/webstore/detail/livepage/pilnojpmdoofaelbinaeodfpjheijkbh/details

# Getting Started

### Local development

  https://livepage-marketing.localhost/

### Production
  
  https://livepage.mikerogers.io/ - This points to a CDN (CloudFront), that loads the site from Heroku.

## Setup a new environment

Copy and paste the below command and you should be good to go! Also consider [Puma-dev](https://gist.github.com/MikeRogers0/29ad917e3e34bb8af403f161e78af233).

### Services and Libraries

    xcode-select --install &&
    brew install tidy-html5 phantomjs &&
    brew install memcached &&
    brew install imagemagick &&
    gem install foreman &&
    gem install middleman &&
    gem install powder

## The Marketing Site

    cd ~/Workspace/LivePage-Marketing &&
    git clone git@github.com:MikeRogers0/LivePage-Landing.git &&
    cd LivePage-Marketing &&
    bundle &&
    puma-dev link -n LivePage-Marketing &&
    powder open

## Running the website locally

In terminal run:

    bundle exec middleman server

The navigate to the outputted domain. Alternatively setup using [Puma-dev](https://gist.github.com/MikeRogers0/29ad917e3e34bb8af403f161e78af233) and visit:

    https://livepage-marketing.localhost/
