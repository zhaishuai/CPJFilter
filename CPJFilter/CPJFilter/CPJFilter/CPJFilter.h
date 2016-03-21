//
//  CPJFilter.h
//  CPJFilter
//
//  Created by shuaizhai on 3/21/16.
//  Copyright © 2016 pcx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPJFilterProtocol.h"


@interface CPJFilter : NSObject<CPJFilterProtocol>

@property (nonatomic)NSDictionary     *viewControllerTable;
@property (nonatomic)UIViewController *loginController;
@property (nonatomic)NSString *storyboardName;

+ (instancetype)shareInstance;

@end
