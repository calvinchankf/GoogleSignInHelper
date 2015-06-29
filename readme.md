# Intro

A simple wrapper of google sign in for ios, let's code less in AppDelegate.

# Prerequisite
- configure google sign in properly
1. pod install Google/SignIn
2. configure GoogleService-Info.plist, it should be something like below
  ![Image of info-plist]
  (https://raw.githubusercontent.com/calvinchankf/GoogeSignInHelper/master/info-plist.png)
3. add url scheme, it shouldd be something like this
  ![Image of url-scheme]
  (https://raw.githubusercontent.com/calvinchankf/GoogeSignInHelper/master/url_scheme.png)
  

# How to use
- Import GoogeSignInHelper.h and .m to a project and adopt GoogeSignInHelperDelegate
```
@interface AppDelegate ()<GoogeSignInHelperDelegate>
```
- Configure the helper in didFinishLaunchingWithOptions
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  //...

  [[GoogeSignInHelper currentHelper] configure:self];
  
  return YES;
}
```
- Handle open url
```
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
  return [GoogeSignInHelper handleURL:url sourceApplication:sourceApplication annotation:annotation];
}
```
- Implement delegate methods in AppDelegate
```
#pragma mark - GoogeSignInHelperDelegate

- (void)googleSignInAuth {
  NSLog(@"googleSignInAuth");
  // e.g. switch to authViewContoller
}

- (void)googleSignInUnAuth {
  NSLog(@"googleSignInUnAuth");
  //  switch to unauthViewContoller
}
```
