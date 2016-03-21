//
//  ViewController.m
//  CPJFilter
//
//  Created by shuaizhai on 3/21/16.
//  Copyright © 2016 pcx. All rights reserved.
//

#import "ViewController.h"
#import "CPJFilter.h"
#import "TempViewController.h"
#import "HViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIViewController *vc = [UIViewController new];
    vc.view.frame = CGRectMake(0, 0, 100, 100);
    vc.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showVC:(id)sender {
    
    CPJFilter *filter = [CPJFilter new];
    filter.viewControllerTable = @{@"临时VC": [TempViewController class]};
    
    [filter pushViewControllerWithID:@"临时VC" withValueDict:nil];
    
//    TempViewController *vc = [[TempViewController alloc] init];
//    
//    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}
- (IBAction)showHvc:(id)sender {
    CPJFilter *filter = [CPJFilter new];
    filter.storyboardName = @"Main";
    filter.viewControllerTable = @{@"MyHVC":@"com.my"};
    [filter pushViewControllerWithID:@"MyHVC" withValueDict:nil];
    
}

@end
