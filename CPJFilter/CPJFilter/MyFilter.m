//
//  MyFilter.m
//  CPJFilter
//
//  Created by shuaizhai on 3/21/16.
//  Copyright © 2016 pcx. All rights reserved.
//

#import "MyFilter.h"
#import "TempViewController.h"
#import "HViewController.h"
#import "LoginViewController.h"


@implementation MyFilter

- (void)configViewControllerTable{
    self.storyboardName = @"Main";
    self.viewControllerTable =
  @{
    CPJADD_NEED_LOGIN_VC(TempVieControllerID, TempViewController)
    CPJADD_NEED_LOGIN_STORYBOARD_VC(HViewControllerID, @"com.my")
    };
    [self setLoginVCWithClass:[LoginViewController class]];
}


- (void)loginWithCompletion:(void (^)(BOOL loginSuccess))completion{
    [super loginWithCompletion:completion];
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"user_id"];
    [[NSUserDefaults standardUserDefaults] setObject:@"jim" forKey:@"user_name"];
    [[NSUserDefaults standardUserDefaults] setObject:@"wer0ids0cojclvknj" forKey:@"token"];
    self.loginSuccess = YES;
}

- (void)logout{
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"user_id"];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"user_name"];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"token"];
//    [self needLogin];
}

- (BOOL)hasLogin{
    
    if([[[NSUserDefaults standardUserDefaults] stringForKey:@"user_id"] isEqualToString:@""] || [[[NSUserDefaults standardUserDefaults] stringForKey:@"user_name"] isEqualToString:@""] || [[[NSUserDefaults standardUserDefaults] stringForKey:@"token"] isEqualToString:@""]){
        return NO;
    }
    
    return YES;
}

@end
