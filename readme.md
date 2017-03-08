
## Thank you guys so much for all your support. The project has been discontinued. Thank you.

# Intro

A simple wrapper of google sign in for ios, let's code less in AppDelegate.

# Prerequisite
- configure google sign in properly
1. pod install Google/SignIn
2. configure GoogleService-Info.plist, it should be something like below
  ![Image of info-plist]
  (https://raw.githubusercontent.com/calvinchankf/GoogleSignInHelper/master/info-plist.png)
3. add url scheme, it shouldd be something like this
  ![Image of url-scheme]
  (https://raw.githubusercontent.com/calvinchankf/GoogleSignInHelper/master/url_scheme.png)
  

# How to use
- Import GoogleSignInHelper.h and .m to a project and adopt GoogleSignInHelperDelegate
```
@interface AppDelegate ()<GoogleSignInHelperDelegate>
```
- Configure the helper in didFinishLaunchingWithOptions
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  //...

  // use youtube as an example for a scope
  [[GoogleSignInHelper currentHelper] configure:@[@"https://www.googleapis.com/auth/youtube"] with:self];
  
  return YES;
}
```
- Handle open url
```
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
  return [GoogleSignInHelper handleURL:url sourceApplication:sourceApplication annotation:annotation];
}
```
- Implement delegate methods in AppDelegate
```
#pragma mark - GoogleSignInHelperDelegate

- (void)googleSignInAuth {
  NSLog(@"googleSignInAuth");
  // e.g. switch to authViewContoller
}

- (void)googleSignInUnAuth {
  NSLog(@"googleSignInUnAuth");
  //  switch to unauthViewContoller
}
```
