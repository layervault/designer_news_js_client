RSVP    = require 'rsvp'
needle  = require 'needle'

# Handles API authentication and the related client configuration.
module.exports = class Authenticate
  # Constructs a new Authenticate object
  #
  # @param [Configuration] config The client configuration
  constructor: (@config) ->
    @tokenEndpoint = @config.apiBase + '/oauth/token'

  # Performs username/password authentication to retrieve OAuth tokens.
  #
  # @param [String] username The login username. For LayerVault this is the user's email address.
  # @param [String] paassword The login password.
  # @param [Function] cb The finished callback
  withPassword: (username, password, cb = ->) ->
    new RSVP.Promise (resolve, reject) =>
      needle.post @tokenEndpoint,
        grant_type: 'password'
        username: username
        password: password
        client_id: @config.oauthKey
        client_secret: @config.oauthSecret
      , (error, resp, body) =>
        if error?
          reject(error)
          cb(error, null)
          return

        @config.accessToken = body.access_token
        data = accessToken: @config.accessToken

        @trigger 'authorized', data
        resolve(data)
        cb(null, data)

RSVP.EventTarget.mixin(Authenticate::)