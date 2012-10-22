# Low Voltage

If you've heard of [High Voltage](https://github.com/thoughtbot/high_voltage) then all you need to know is we're like that, but for blogs.

High Voltage allows you to very easily setup static pages in your Rails app without having to setup extra controllers and actions. You put a page of content in a pages folder under your views and it shows up on your website as `/pages/blah`. This is the same concept, only with a blog format. You write a blog post, add some metadata, drop it in a folder, and voila your blog has a new post.

I wrote Low Voltage because I used [Nesta](https://github.com/gma/nesta) and really liked it, but then wanted to add more Rails to it. Instead of going through mounting it in my app, I found High Voltage and re-tooled it to work as a blog platform as well.

## Install

Add the following line to your Gemfile:

    gem 'low_voltage'

## Basic Usage

1. Add a directory called `posts` with a subdirectory called `sources` to your views folder.
2. Place your markdown flavored blog posts in the `sources` directory.
3. Refresh.

## TODO

* Add some basic configuration options to override the defaults.
* Add an RSS feed.
* I should probably get in the habbit of writing tests...

## Copyright

Copyright (c) 2012 Adam Michel. See LICENSE for details.
