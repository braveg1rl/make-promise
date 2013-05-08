makePromise = require "./make-promise"

module.exports = 
  pending: ->
    pending = {}
    pending.promise = makePromise (resolve, reject) ->
      pending.fulfill = resolve
      pending.reject = reject
    pending
