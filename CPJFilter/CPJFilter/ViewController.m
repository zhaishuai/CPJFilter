//
//  ViewController.m
//  CPJFilter
//
//  Created by shuaizhai on 3/21/16.
//  Copyright © 2016 pcx. All rights reserved.
//

#import "ViewController.h"
#import "MyFilter.h"
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

    [[MyFilter shareInstance] pushViewControllerWithID:TempVieControllerID withValueDict:nil completion:nil];
}
- (IBAction)showHvc:(id)sender {
    [[MyFilter shareInstance] pushViewControllerWithID:HViewControllerID withValueDict:nil completion:^(id obj) {
        [obj show];
    }];
    
}
- (IBAction)logout:(id)sender {
    [[MyFilter shareInstance] logout];
}

@end
