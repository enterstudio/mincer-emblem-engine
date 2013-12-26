vm = require 'vm'
fs = require 'fs'
sys = require 'sys'
path = require 'path'
mincer = require 'mincer'

sandbox = {self: {}}
context = vm.createContext sandbox

################################################################################
# Required libs
include = (file_name)->
  code = fs.readFileSync path.resolve file_name
  vm.runInContext code, context, file_name

include "#{__dirname}/../vendor/jquery_shim.js"
include "#{__dirname}/../vendor/handlebars.js"
include "#{__dirname}/../vendor/ember.js"
include "#{__dirname}/../vendor/emblem.js"


################################################################################
# EmblemEngine

options =
  template_path: '/templates/'

EmblemEngine = module.exports = ->
  mincer.Template.apply @, arguments

EmblemEngine.options = (opts = {})->
  options = opts

EmblemEngine.defaultMimeType = 'application/javascript'

EmblemEngine.register = (environment, options = {})->
  EmblemEngine.options options
  environment.registerEngine ".emblem", EmblemEngine


EmblemEngine.prototype.evaluate = (ctx, locals)->
  template = context.Emblem.precompile(context.Ember.Handlebars, @data).toString()
  root = false

  ctx.environment.paths.forEach (path)=>
    path = path + options.template_path
    root = path if @file.indexOf(path) is 0

  template_path = @file.substring root.length
  template_path = template_path.split('.')[0]
  "Ember.TEMPLATES['#{template_path}'] = Ember.Handlebars.template(#{template});\n"
