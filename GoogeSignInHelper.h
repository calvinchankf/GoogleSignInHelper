//
//  GoogeSignInHelper.h
//  Musik
//
//  Created by calvin on 6/6/2015.
//  Copyright (c) 2015年 me.calvinchankf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Google/SignIn.h>

@protocol GoogeSignInHelperDelegate <NSObject>

- (void)googleSignInAuth;
- (void)googleSignInUnAuth;

@end

@interface GoogeSignInHelper : NSObject<
  GIDSignInUIDelegate,
  GIDSignInDelegate
>

@property (nonatomic, weak) id<GoogeSignInHelperDelegate> delegate;

+ (instancetype)currentHelper;
+ (BOOL)handleURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

- (void)configure:(id<GoogeSignInHelperDelegate>)delegate;

@end
