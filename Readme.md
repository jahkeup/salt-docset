# Salt Dash docset

This repo can be to produce a Salt.docset that can be used for Dash or
Zeal.

## Quick, give me the docset!

Okay! [Download me here!](https://github.com/jahkeup/salt-docset/releases)

Make sure you move it out of your downloads into a more permanent
location when you add it to Dash.

## Usage

Here's some easy steps to create your own docset, though you can
download one from the releases. If it gets out of sync with
[Salt's](https://github.com/salt/saltstack) current release and you
want to update that, please do and submit a PR. I'll happily accept
and update it for everyone.

1. `git clone` me. (or fork and clone your repo if you're messing with things)

2. Install some dependencies.

    You can use `make deps` to get
    everything you need but it does assume you're on OS X with homebrew
    installed *and* that you've got virtualenv running. If you don't no
    worries, just install `imagemagick`, `sphinx` or `python-sphinx` on
    some OSes, and my modified version of `doc2dash` (you can install
    via pip - `pip install git+https://github.com/jahkeup/doc2dash.git@master`).
   
3. Get (haha git) the git submodule aka Salt's source. (`git submodule
   update --init`).
   
4. Create the docset - `make docset`

5. (optional) Add docset to dash - `make add-docset` (Again, assumes
   OS X, don't run if you're not on OS X).


## Notes:

Item `3` on the list pulls whatever the last version of salt that I
pulled into the repo and commited in (`2014.1.4 - 4ab9e67`). You can
[take a look at the releases](https://github.com/saltstack/salt/releases)
and update that submodule to build docsets for whatever version your
heart desires. If you do update it to the current version and I have
not, please feel free to fork and create a pull request so I can
update both the submodule ref and upload a [docset release](https://github.com/jahkeup/salt-docset/releases) to Github.

# License

NOTE: This script does pull in copyright'd materials from Saltstack
(icons) for use in the docset. That is their work and I take no credit
for that, I love salt <3. See
[their license](https://github.com/saltstack/salt/blob/develop/LICENSE)
for details.

The MIT License (MIT)

Copyright (c) 2014 Jacob Vallejo

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
