mincer = require 'mincer'
emblem_engine = require __dirname + '/../src/mincer_emblem_engine'

mincer_environment = new mincer.Environment()
emblem_engine.register mincer_environment
mincer_environment.appendPath __dirname

console.log mincer_environment.findAsset('templates/index').toString()