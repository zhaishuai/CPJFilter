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



@implementation MyFilter

- (void)configViewControllerTable{
    self.storyboardName = @"Main";
    self.viewControllerTable =
  @{
    CPJADD_NEED_LOGIN_VC(TempVieControllerID, TempViewController)
    CPJADD_NEED_LOGIN_STORYBOARD_VC(HViewControllerID, @"com.my")
    };
}

@end
