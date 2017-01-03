# make-promise [![Build Status](https://travis-ci.org/braveg1rl/make-promise.png?branch=master)](https://travis-ci.org/braveg1rl/make-promise) [![Dependency Status](https://david-dm.org/braveg1rl/make-promise.png)](https://david-dm.org/braveg1rl/make-promise)

A function that creates a Bluebird promise that can be resolved or rejected using a Node-style callback.

## Usage

`make-promise` exports a single function, which takes a function as it sole argument. After you have called `makePromise`, this function is called immediately afterwards with a Node-style callback as its sole argument.

* Calling the callback with a truthy error argument will cause the promise to be rejected with the value of the error argument.
* Calling the callback with a falsy error argument will cause the promise to be fulfilled with the value of the result argument. If there is no result argument, the promise will be fulfilled with `undefined`.

## Code example

```javascript
var skyIsFalling = false
var makePromise = require("make-promise")
var promise = makePromise(function(cb) {
  setImmediate(function() {
    if skyIsfalling
      cb(new Error("Sky is falling."))
    else
      cb()
  })
})
promise.then(
  function(){
    // phew!
  },
  function(err) {
    console.error err.toString() + " Better take cover."
  })
```

## License

make-promise is released under the [MIT License](http://opensource.org/licenses/MIT).  
Copyright (c) 2017 Braveg1rl  
