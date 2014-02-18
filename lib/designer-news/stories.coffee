module.exports = class Stories
  constructor: (@api) ->

  recent: (args = {}, cb = ->) -> @api.get '/stories/recent', args, cb