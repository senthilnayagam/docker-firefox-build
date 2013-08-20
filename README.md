docker-firefox-build
====================

dockerfile for building firefox

originally derived from http://gregoryszorc.com/blog/2013/05/19/using-docker-to-build-firefox/

fixed a few build dependencies


<pre><code>
#first time only
sudo docker build -t firefox github.com/senthilnayagam/docker-firefox-build

#subsequent usage
sudo docker run -i -t firefox /bin/bash

$ su - firefox
$ cd mozilla-central

# first time only
$ hg clone https://hg.mozilla.org/mozilla-central

# subsequent times 
$ hg pull --update

$ ./mach build

#if it succeeds
$ cd /home/firefox/mozilla-central/obj-x86_64-unknown-linux-gnu/dist/bin

$ ./firefox -v
Mozilla Firefox 26.0a1

</code></pre>




##Author
Senthil Nayagam

senthil (at) railsfactory dot com
