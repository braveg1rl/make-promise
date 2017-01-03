Promise = require "bluebird"

module.exports = makePromise = (fn) ->
  resolvePromise = undefined
  rejectPromise = undefined

  promise = new Promise (resolve, reject) ->
    resolvePromise = resolve
    rejectPromise = reject
    cb = (err, result, forceError = false) ->
      if err? or forceError then rejectPromise err else resolvePromise result
    try fn cb catch error then cb error, null, true
