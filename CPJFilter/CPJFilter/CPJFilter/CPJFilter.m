//
//  CPJFilter.m
//  CPJFilter
//
//  Created by shuaizhai on 3/21/16.
//  Copyright © 2016 pcx. All rights reserved.
//

#import "CPJFilter.h"
#import <objc/runtime.h>
#import "AppDelegate.h"

@implementation CPJFilter

+ (instancetype)shareInstance{
    static CPJFilter *filter;
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        filter = [[[self class] alloc] init];
        filter.storyboardName = @"Main";
        [filter configViewControllerTable];
    });
    return filter;
}

// overwrite
//
- (void)configViewControllerTable{

}

// overwrite
//
- (BOOL)checkLogin{
    
    return NO;
}

// overwrite
//
- (void)login{
    
}

// overwrite
//
- (void)logout{
    
}

- (id)pushViewControllerWithID:(NSString *)viewControllerID withValueDict:(NSDictionary *)dict{
    UINavigationController *pvc = (UINavigationController *)[CPJFilter getTopMostViewController];
    UIViewController *vc = [self createViewControllerWithID:viewControllerID withValueDict:dict];
    [pvc pushViewController:vc animated:YES];
    return vc;
}

- (void)presentViewControllerWithID:(NSString *)viewControllerID withValueDict:(NSDictionary *)dict{
    
}

- (id)createViewControllerWithID:(NSString *)viewControllerID withValueDict:(NSDictionary *)dict{
    NSArray *array = [self.viewControllerTable objectForKey:viewControllerID];
    NSAssert(array.count == 2, @"configViewControllerTable发生错误！正确方式如：@[[TempViewController class],@YES]");
    NSAssert(![[array firstObject] isKindOfClass:[NSNumber class]], @"configViewControllerTable发生错误！正确方式如：@[[TempViewController class],@YES]");
    id cla               = [array firstObject];
    BOOL needCheckLogin  = [[array lastObject] boolValue];
    UIViewController *vc = nil;
    if([cla isKindOfClass:[NSString class]]){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:self.storyboardName bundle:nil];
        vc = [storyboard instantiateViewControllerWithIdentifier:cla];
    }else{
        NSObject *object = [[cla alloc] init];
        if([object isKindOfClass:[UIViewController class]]){
            vc = [[cla alloc] init];
        }
    }
    return vc;
}


+ (UIViewController*) getTopMostViewController
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(window in windows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                break;
            }
        }
    }
    
    for (UIView *subView in [window subviews])
    {
        UIResponder *responder = [subView nextResponder];
        
        //added this block of code for iOS 8 which puts a UITransitionView in between the UIWindow and the UILayoutContainerView
        if ([responder isEqual:window])
        {
            //this is a UITransitionView
            if ([[subView subviews] count])
            {
                UIView *subSubView = [subView subviews][0]; //this should be the UILayoutContainerView
                responder = [subSubView nextResponder];
            }
        }
        
        if([responder isKindOfClass:[UIViewController class]]) {
            return [self topViewController: (UIViewController *) responder];
        }
    }
    
    return nil;
}

+ (UIViewController *) topViewController: (UIViewController *) controller
{
    BOOL isPresenting = NO;
    do {
        // this path is called only on iOS 6+, so -presentedViewController is fine here.
        UIViewController *presented = [controller presentedViewController];
        isPresenting = presented != nil;
        if(presented != nil) {
            controller = presented;
        }
        
    } while (isPresenting);
    
    return controller;
}

@end
