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
    emblem_engine.options template_path: "/my-templates/"

    # env now expects emblem templates to be under MINCER_LOOKUP_PATH/my-templates/*.emblem

Enjoy!
