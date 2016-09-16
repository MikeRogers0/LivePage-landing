# LivePage Landing Site

This is is used to drive traffic towards the LivePage chrome store webpage https://chrome.google.com/webstore/detail/livepage/pilnojpmdoofaelbinaeodfpjheijkbh/details

# Getting Started

## Setting up

    xcode-select --install
    gem install middleman

## Turning on the server

    middleman server

## Building & deploying

    middleman build
    s3_website push

Then purge `https://livepage.mikerogers.io/*` on cloudflare.
