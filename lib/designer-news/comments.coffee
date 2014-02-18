module.exports = class Comments
  constructor: (@api) ->

  get: (id, cb = ->) -> @api.get "/comments/#{id}", {}, cb

  upvote: (id, cb = ->) -> @api.post "/comments/#{id}/upvote", {}, cb
  reply: (id, comment, cb = ->) -> @api.post "/comments/#{id}/reply", {'comment[body]': comment}, cb