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

@protocol CPJFilterProtocol <NSObject>

- (void)setViewControllerTable:(NSDictionary *)dictionary;

- (void)setLoginViewController:(UIViewController *)loginController;

- (void)pushViewControllerWithID:(NSString *)viewControllerID withValueDict:(NSDictionary *)dict;

- (void)presentViewControllerWithID:(NSString *)viewControllerID withValueDict:(NSDictionary *)dict;

- (BOOL)checkLogin;

- (void)logout;

- (void)login;

+ (UIViewController*) getTopMostViewController;

+ (UIViewController *) topViewController: (UIViewController *) controller;



@end


#endif /* CPJFilterProtocol_h */
