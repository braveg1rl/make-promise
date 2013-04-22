makePromise = require "./make-promise"

module.exports = 
  pending: ->
    localResolve = undefined
    localReject = undefined
    promise = makePromise (resolve, reject) ->
      localResolve = resolve
      localReject = reject
    return pending = 
      promise: promise
      fulfill: localResolve
      reject: localReject