[![npm](https://img.shields.io/npm/v/cordova-plugin-launchscreen-storyboard.svg?maxAge=86400)](https://www.npmjs.com/package/cordova-plugin-launchscreen-storyboard)
[![npm](https://img.shields.io/npm/dm/cordova-plugin-launchscreen-storyboard.svg?maxAge=86400)](https://www.npmjs.com/package/cordova-plugin-launchscreen-storyboard)
[![npm](https://img.shields.io/npm/l/cordova-plugin-launchscreen-storyboard.svg?maxAge=2592000)](https://www.npmjs.com/package/cordova-plugin-launchscreen-storyboard)

# cordova-plugin-launchscreen-storyboard
A cordova plugin for using a launch screen storyboard as the splashscreen instead of an image

# Installation
`cordova plugin add cordova-plugin-launchscreen-storyboard`

or via github

`cordova plugin add https://github.com/toddbluhm/cordova-plugin-launchscreen-storyboard.git`


# Usage

Add the following code to your `config.xml` to get the plugin with default settings:
```xml
<plugin name="cordova-plugin-launchscreen-storyboard" spec="~1.0.0" />
```

or to add it with all the settings use the following code:

```xml
<feature name="LaunchScreen">
  <param name="ios-package" value="LaunchScreenStoryboard" onload="true" />
  <preference name="StoryboardName" value="LaunchScreen" />
  <preference name="FadeOut" value="true" />
  <preference name="FadeOutDuration" value="0.5" />
</feature>
```

Once the plugin is setup you must now tell it when to fade out. You can do this by setting up a handler in `index.html` for the [`deviceready`](http://cordova.apache.org/docs/en/6.x/cordova/events/events.html#deviceready) event.

**NOTE**:
`StoryboardName` must match the name of your "Launch Screen File" in Xcode,  or a null-pointer exception will follow.
If your `StoryboardName` is not `LaunchScreen`, you must specify the following preference in your `config.xml`:

```xml
<preference name="StoryboardName" value="YOUR_STORY_BOARD_NAME" />
```

Something like the following should work:
```js
document.addEventListener("deviceready", function() {
  window.LaunchScreen.hide();
}, false);
```

# Preferences
- **`StoryboardName`** - The name of the storyboard that contains your launch screen view controller.
This will only instantiate the top level view controller in the storyboard.

- **`FadeOut`** - Enable/Disable the view fading out when its told to `hide()`. This uses an EaseOut function.

- **`FadeOutDuration`** - How long should the fade out last (in seconds).

# API

These are the javascript APIs exposed off of the `window.LaunchScreen` object.

- **`hide( callback )`** - Hides the launch screen. Usually called in the `deviceready` event handler. The `callback` is called after the launch screen is fully hidden. `callback` has an `error` param which will be `null` or an error object if an error occurred.

- **`show( callback )`** - Shows the launch screen. Should never need to be called in practice. The `callback` is called after the launch screen is fully visible. `callback` has an `error` param which will be `null` or an error object if an error occurred.

# Supported Platforms
- iOS
