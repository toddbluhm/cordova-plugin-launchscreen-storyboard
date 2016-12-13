var exec = require('cordova/exec')

var LaunchScreen = {
  hide: function (callback) {
    exec(callback.bind(null, null), callback, 'LaunchScreen', 'hide', [])
  },

  show: function (callback) {
    exec(callback.bind(null, null), callback, 'LaunchScreen', 'show', [])
  }
}

module.exports = LaunchScreen
