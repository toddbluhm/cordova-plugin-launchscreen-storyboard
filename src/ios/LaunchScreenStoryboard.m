//
//  LaunchScreenStoryboard.m
//
//  Created by Todd Bluhm on 11/1/16.
//

#import "LaunchScreenStoryboard.h"
#import <Cordova/CDVViewController.h>

#define kDefaultStoryboardName @"CDVLaunchScreen"
#define kDefaultFadeOut YES
#define kDefaultFadeOutDuration 0.5f

@implementation LaunchScreenStoryboard

- (id)settingForKey:(NSString*)key
{
  return [self.commandDelegate.settings objectForKey:[key lowercaseString]];
}

- (void)pluginInitialize
{
  // Get all the plugin settings
  _storyboardName = [self settingForKey:@"StoryboardName"];
  if (_storyboardName == nil) {
    _storyboardName = kDefaultStoryboardName;
  }

  NSString* fadeOut = [self settingForKey:@"FadeOut"];
  if (fadeOut == nil) {
    _performFadeOut = YES;
  } else {
    _performFadeOut = [fadeOut boolValue];
  }

  NSString* fadeOutDuration = [self settingForKey:@"FadeOutDuration"];
  if (fadeOutDuration == nil) {
    _fadeOutDuration = kDefaultFadeOutDuration;
  } else {
    _fadeOutDuration = [fadeOutDuration floatValue];
  }

  UIStoryboard* sb = [UIStoryboard storyboardWithName:_storyboardName
                                               bundle:nil];
  _launchScreenViewController = [sb instantiateInitialViewController];
  _launchScreenStartAlpha = _launchScreenViewController.view.alpha;

  [self show:nil];
}

- (void)show:(CDVInvokedUrlCommand*)command
{
  _launchScreenViewController.view.alpha = _launchScreenStartAlpha;
  [self.viewController addChildViewController:_launchScreenViewController];
  _launchScreenViewController.view.frame = self.viewController.view.frame;
  [self.viewController.view addSubview:_launchScreenViewController.view];
  [_launchScreenViewController didMoveToParentViewController:self.viewController];

  [self returnSuccess: command];
}

- (void)hide:(CDVInvokedUrlCommand*)command
{
  if (_performFadeOut) {
    [UIView animateWithDuration:_fadeOutDuration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                       _launchScreenViewController.view.alpha = 0.0;
                     }
                     completion:^(BOOL finished) {
                       [self removeLaunchScreen];
                       [self returnSuccess: command];
                     }];
  } else {
    [self removeLaunchScreen];
    [self returnSuccess: command];
  }
}

- (void)removeLaunchScreen
{
  [_launchScreenViewController willMoveToParentViewController:nil];
  [_launchScreenViewController.view removeFromSuperview];
  [_launchScreenViewController removeFromParentViewController];
}

- (void)returnSuccess:(CDVInvokedUrlCommand*)command
{
  if (command != nil) {
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK]
                                callbackId:command.callbackId];
  }
}

@end
