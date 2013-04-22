promiscuous = require "promiscuous"

module.exports = (func) ->
  deferred = promiscuous.deferred()
  resolve = (value) -> deferred.resolve value
  reject = (error) -> deferred.reject error
  func resolve, reject
  deferred.promise

# module.exports = (func) ->
#   promise = new RSVP.Promise
#   resolve = (value) -> promise.resolve value
#   reject = (error) -> promise.reject error
#   func resolve, reject
#   promise