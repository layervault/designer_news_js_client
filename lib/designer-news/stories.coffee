module.exports = class Stories
  constructor: (@api) ->

  frontPage: (args = {}, cb = ->) -> @api.get '/stories', args, cb
  recent: (args = {}, cb = ->) -> @api.get '/stories/recent', args, cb