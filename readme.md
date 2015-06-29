# Intro

A simple wrapper of google sign in for ios, lets' code less in AppDelegate.

# Prerequisite
- configure google sign in properly
1. pod install Google/SignIn
2. configure GoogleService-Info.plist, it should be something like below
<p align="center" >
  <img src="...">
</p>
3. add url scheme, it shouldd be something like this
<p align="center" >
  <img src="...">
</p>

# How to use
- Adopt GoogeSignInHelperDelegate
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