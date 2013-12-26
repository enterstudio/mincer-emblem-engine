#!/bin/sh
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/../
cd $ROOT_DIR/vendor
wget -N https://raw.github.com/machty/emblem.js/master/dist/emblem.js
wget http://builds.handlebarsjs.com.s3.amazonaws.com/handlebars.runtime-v1.2.0.js -O handlebars.js
wget -N http://builds.emberjs.com/release/ember.js