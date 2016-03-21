//
//  CPJFilterProtocol.h
//  CPJFilter
//
//  Created by shuaizhai on 3/21/16.
//  Copyright © 2016 pcx. All rights reserved.
//

#ifndef CPJFilterProtocol_h
#define CPJFilterProtocol_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define CPJADD_NEED_LOGIN_VC(ID, viewController)\
ID:@[[viewController class], @YES],
#define CPJADD_NEED_LOGIN_STORYBOARD_VC(ID, viewControllerID)\
ID:@[viewControllerID, @YES],

#define CPJADD_VC(ID, viewController)\
ID:@[[viewController class], @NO],
#define CPJADD_STORYBOARD_VC(ID, viewControllerID)\
ID:@[viewControllerID, @NO],

@protocol CPJFilterProtocol <NSObject>

- (void)configViewControllerTable;

- (id)pushViewControllerWithID:(NSString *)viewControllerID withValueDict:(NSDictionary *)dict;

- (void)presentViewControllerWithID:(NSString *)viewControllerID withValueDict:(NSDictionary *)dict;

- (BOOL)checkLogin;

- (void)logout;

- (void)login;

+ (UIViewController*) getTopMostViewController;

+ (UIViewController *) topViewController: (UIViewController *) controller;



@end


#endif /* CPJFilterProtocol_h */
