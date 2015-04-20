# README

Simple app that display upcoming concerts from [Cheapthrills](http://www.cheapthrills.ca/news.html)

## Setup

You will need a Soundcloud client_id and set it up to the `SOUNDCLOUD_CLIENT_ID` environment variable.

You can then execute `rake concerts:add` to add concerts from cheapthrills and `rake worker:empty_queue` to add all the tracks informations from soundcloud.
