module.exports = class Stories
  constructor: (@api) ->

  get: (id, cb = ->) -> @api.get "/stories/#{id}", {}, cb
  frontPage: (args = {}, cb = ->) -> @api.get '/stories', args, cb
  recent: (args = {}, cb = ->) -> @api.get '/stories/recent', args, cb
  search: (query, cb = ->) -> @api.get '/stories/search', {query: query}, cb