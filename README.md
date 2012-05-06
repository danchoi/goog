# goog

A simple tool to search Google from the command line and show search results in plain text.


## Install

    gem install goog


## Usage

```
Usage: goog [options] [query]
    -h, --help                       Show this message
    -d, --date-range [DATE RANGE]    Show results for date range. See below for options.
    -n, --num-pages [NUM PAGES]      Show NUM PAGES pages of results
    -c, --color                      Force color output
    -v, --vim                        Open results in Vim. See below for key mappings. 

DATE RANGE options for -d option:
    h   last hour
    d   last day (24 hours)
    w   last week
    m   last month
    y   last year

VIM KEY MAPPINGS
    <leader>o       open URL on or after cursor in default external web browser
    <leader>O       open URL on or after cursor in split Vim window using elinks, links, or lynx

```

goog will color the output a little if STDOUT is the tty. 

Unlike Google in the web browser, you can redirect goog's output like any Unix text stream.


NOTE: Very soon I'll release a Vim plugin version that can be invoked within a Vim session.


## Screenshot

Pure command line mode:

![screenshot](https://github.com/danchoi/goog/raw/master/screenshot.png)

goog in Vim mode. (Search command: `goog -v -d m boston hackathon`)

You can move the cursor on or before the link you want to
open in your browser, and then press `<leader>o` to open it.

![screenshot](https://github.com/danchoi/goog/raw/master/screenshot-vim.png)

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


