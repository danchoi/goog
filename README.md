# goog

A simple tool to search Google from the command line and show search results in plain text.


## Install

    gem install goog


## Usage

```
Usage: goog [-n pages] [-d date range type] [query]

Synopsis:
    -n [pages]                      Return n pages of results
    -d [date range type]            Limit results to date range (see below for codes)
    -h, --help                      Show this message

Date range types for -d option:
  
    h   last hour
    d   last day (24 hours)
    w   last week
    m   last month
    y   last year

```

goog will color the output a little if STDOUT is the tty. 

Unlike Google in the web browser, you can redirect goog's output like any Unix text stream.

## Screenshot

![screenshot](https://github.com/danchoi/goog/raw/master/screenshot.png)


## MIT License 

Copyright (c) 2012 Daniel Choi, http://danielchoi.com/software/

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


