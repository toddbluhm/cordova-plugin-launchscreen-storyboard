var exec = require('cordova/exec')

var LaunchScreen = {
  hide: function (callback) {
    callback = callback || function () {}
    exec(callback.bind(null, null), callback, 'LaunchScreen', 'hide', [])
  },

  show: function (callback) {
    callback = callback || function () {}
    exec(callback.bind(null, null), callback, 'LaunchScreen', 'show', [])
  }
}

module.exports = window.LaunchScreen = LaunchScreen
