module.exports = class Motd
  constructor: (@api) ->

  get: (cb = ->) -> @api.get '/motd', {}, cb
  upvote: (cb = ->) -> @api.post '/motd/upvote', {}, cb
  downvote: (cb = ->) -> @api.post '/motd/downvote', {}, cb