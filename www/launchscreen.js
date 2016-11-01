var exec = require('cordova/exec')

var LaunchScreen = {
  hide: function () {
    exec(null, null, 'LaunchScreen', 'hide', [])
  },

  show: function () {
    exec(null, null, 'LaunchScreen', 'show', [])
  }
}

module.exports = LaunchScreen
