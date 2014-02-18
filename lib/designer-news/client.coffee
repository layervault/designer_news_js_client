Authenticate = require './authenticate'
API = require './api'

Stories = require './stories'

# The API client base. Holds references to our authentication and configuration.
# It lets you choose an organization for the API request, and the other classes
# handle things from there.
module.exports = class Client
  # Constructs a new client object.
  #
  # @param [Configuration] config The configuration to use for this client
  constructor: (@config) ->
    @auth = new Authenticate(@config)
    @api = new API(@, @config)

    @stories = new Stories(@api)

  # Fetches information about the logged in user
  #
  # @param [Function] cb The finished callback
  me: (cb = ->) -> @api.get '/me', {}, cb.bind(@)