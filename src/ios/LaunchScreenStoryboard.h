//
//  LaunchScreenStoryboard.h
//
//  Created by Todd Bluhm on 11/1/16.
//

#ifndef LaunchScreenStoryboard_h
#define LaunchScreenStoryboard_h

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface LaunchScreenStoryboard : CDVPlugin {
  BOOL _visible;
  BOOL _destroyed;
  UIViewController* _launchScreenViewController;
  NSString* _storyboardName;
  BOOL _performFadeOut;
  float _fadeOutDuration;
  float _launchScreenStartAlpha;
}

- (void)show:(CDVInvokedUrlCommand*)command;
- (void)hide:(CDVInvokedUrlCommand*)command;

@end

#endif /* LaunchScreenStoryboard_h */
