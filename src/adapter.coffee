makePromise = require "./make-promise"

module.exports =
  pending: ->
    pending = {}
    pending.promise = makePromise (cb) ->
      pending.fulfill = (value) -> cb null, value
      pending.reject = (error) -> cb error, null, true
    pending
  resolved: (value) ->
    makePromise (cb) -> cb null, value
  rejected: (value) ->
    makePromise (cb) -> cb value, null, true
  deferred: ->
    pending = {}
    pending.promise = makePromise (cb) ->
      pending.resolve = (value) -> cb null, value
      pending.reject = (reason) -> cb reason, null, true
    pending
