require "setimmediate"

module.exports = makePromise = (fn) ->
  state = null
  delegating = false
  value = null
  deferreds = []
  handle = (deferred) ->
    return deferreds.push deferred if state is null
    return setImmediate ->
      cb = if state then deferred.onFulfilled else deferred.onRejected
      if typeof cb isnt "function"
        return if state then deferred.resolve value else deferred.reject value
      try deferred.resolve cb value
      catch error
        deferred.reject error
  resolve = (newValue) -> resolve_ newValue unless delegating
  reject = (newValue) -> reject_ newValue unless delegating
  resolve_ = (value) ->
    return if state?
    return assumeState true, value if not value or typeof value.then isnt "function"
    delegating = true
    value.then resolve_, reject_
  reject_ = (value) -> assumeState false, value unless state?
  assumeState = (newState, newValue) ->
    state = newState
    value = newValue
    handle deferred while deferred = deferreds.shift()
  try fn resolve, reject
  catch error
    reject error
  then: (onFulfilled, onRejected) ->
    makePromise (resolve, reject) -> handle {onFulfilled, onRejected, resolve, reject}