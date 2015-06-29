//
//  GoogeSignInHelper.m
//  GoogeSignInHelper
//
//  Created by calvin on 6/6/2015.
//  Copyright (c) 2015年 me.calvinchankf. All rights reserved.
//

#import "GoogeSignInHelper.h"
#import "AppDelegate.h"

@implementation GoogeSignInHelper

static GoogeSignInHelper *_googeSignInHelper = nil;

+ (instancetype)currentHelper {
  if (!_googeSignInHelper) {
    _googeSignInHelper = [[GoogeSignInHelper alloc] init];
  }
  return _googeSignInHelper;
}

+ (BOOL)handleURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
  return [[GIDSignIn sharedInstance] handleURL:url
                             sourceApplication:sourceApplication
                                    annotation:annotation];
}

- (void)configure:(NSArray *)scopes with:(id<GoogeSignInHelperDelegate>)delegate {
  
  self.delegate = delegate;
  
  // Google sign-in
  NSError* configureError;
  [[GGLContext sharedInstance] configureWithError: &configureError];
  if (configureError != nil) {
    NSLog(@"Error configuring the Google context: %@", configureError);
  }
  
  [GIDSignIn sharedInstance].uiDelegate = self;
  [GIDSignIn sharedInstance].delegate = self;
  
  // Uncomment to automatically sign in the user.
  [[GIDSignIn sharedInstance] setScopes:scopes];
  [[GIDSignIn sharedInstance] signInSilently];
}

#pragma mark - GIDSignInDelegate

- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
  // Perform any operations on signed in user here.
  NSLog(@"name=%@", user.profile.name);
  NSLog(@"accessToken=%@", user.authentication.accessToken);
  
  if ([GIDSignIn sharedInstance].currentUser.authentication == nil) {
    if (self.delegate && [self.delegate conformsToProtocol:@protocol(GoogeSignInHelperDelegate)]) {
      [self.delegate googleSignInUnAuth];
    }
  } else {
    if (self.delegate && [self.delegate conformsToProtocol:@protocol(GoogeSignInHelperDelegate)]) {
      [self.delegate googleSignInAuth];
    }
  }
}

// This callback is triggered after the disconnect call that revokes data
// access to the user's resources has completed.
- (void)signIn:(GIDSignIn *)signIn didDisconnectWithUser:(GIDGoogleUser *)user withError:(NSError *)error {
  // Perform any operations when the user disconnects from app here.
  NSLog(@"didDisconnectWithUser");
}

#pragma mark - GIDSignInUIDelegate

// Stop the UIActivityIndicatorView animation that was started when the user
// pressed the Sign In button
- (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error {
  //  [myActivityIndicator stopAnimating];
}

// Present a view that prompts the user to sign in with Google
- (void)signIn:(GIDSignIn *)signIn presentViewController:(UIViewController *)viewController {
  UIViewController *rootVC = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
  [rootVC presentViewController:viewController animated:YES completion:nil];
}

// Dismiss the "Sign in with Google" view
- (void)signIn:(GIDSignIn *)signIn dismissViewController:(UIViewController *)viewController {
  UIViewController *rootVC = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
  [rootVC dismissViewControllerAnimated:YES completion:nil];
}

@end
