vm = require 'vm'
fs = require 'fs'
sys = require 'sys'
path = require 'path'
mincer = require 'mincer'

included = false
sandbox = {self: {}}
context = vm.createContext sandbox

################################################################################
# Required libs
include = (file_name)->
  code = fs.readFileSync path.resolve file_name
  vm.runInContext code, context, file_name

################################################################################
# EmblemEngine

options =
  template_path: '/templates/'
  jquery: "#{__dirname}/../vendor/jquery_shim.js"
  handlebars: "#{__dirname}/../vendor/handlebars.js"
  ember: "#{__dirname}/../vendor/ember.js"
  emblem: "#{__dirname}/../vendor/emblem.js"

EmblemEngine = module.exports = ->
  mincer.Template.apply @, arguments

EmblemEngine.options = (opts = {}) ->
  for own key, value of opts
    options[key] = value

EmblemEngine.defaultMimeType = 'application/javascript'

EmblemEngine.register = (environment, options = false)->
  EmblemEngine.options options if options
  environment.registerEngine ".emblem", EmblemEngine

EmblemEngine.prototype.evaluate = (ctx, locals)->
  unless included
    included = true
    include options.jquery
    include options.handlebars
    include options.ember
    include options.emblem

  template = context.Emblem.precompile(context.Ember.Handlebars, @data).toString()
  root = false

  ctx.environment.paths.forEach (path)=>
    path = path + options.template_path
    root = fs.realpathSync(path) if @file.indexOf(path) is 0

  template_path = @file.substring(root.length + 1)
  template_path = template_path.split('.')[0]
  "Ember.TEMPLATES['#{template_path}'] = Ember.Handlebars.template(#{template});\n"
