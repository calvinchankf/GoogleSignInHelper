//
//  GoogleSignInHelper.h
//  GoogleSignInHelper
//
//  Created by calvin on 6/6/2015.
//  Copyright (c) 2015年 me.calvinchankf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Google/SignIn.h>

@protocol GoogleSignInHelperDelegate <NSObject>

- (void)googleSignInAuth;
- (void)googleSignInUnAuth;

@end

@interface GoogleSignInHelper : NSObject<
GIDSignInUIDelegate,
GIDSignInDelegate
>

@property (nonatomic, weak) id<GoogleSignInHelperDelegate> delegate;

+ (instancetype)currentHelper;
+ (BOOL)handleURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

- (void)configure:(NSArray *)scopes with:(id<GoogleSignInHelperDelegate>)delegate;

@end
