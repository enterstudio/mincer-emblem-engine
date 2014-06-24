mincer-emblem-engine
====================

Installation
------------

    npm install mincer-emblem-engine

Usage
------------

    mincer = require 'mincer'
    emblem_engine = require 'mincer-emblem-engine'
    env = new mincer.Environment()
    env.registerEngine ".emblem", emblem_engine
    env.appendPath "assets"

    # env now expects emblem templates to be under assets/templates/template_name.emblem

Options
------------

    emblem_engine = require 'mincer-emblem-engine'
    emblem_engine.options
      template_path: "/my-templates/"
      ember: "vendor/assets/javascripts/ember-1.5.1.prod.js"
      emblem: "vendor/assets/javascripts/emblem.js"
      handlebars: "vendor/assets/javascripts/handlebars-1.3.0.js"

    # env now expects emblem templates to be under MINCER_LOOKUP_PATH/my-templates/*.emblem

Enjoy!
