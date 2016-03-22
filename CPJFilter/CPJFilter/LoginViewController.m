//
//  LoginViewController.m
//  CPJFilter
//
//  Created by shuaizhai on 3/22/16.
//  Copyright © 2016 pcx. All rights reserved.
//

#import "LoginViewController.h"
#import "MyFilter.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)login:(id)sender {
    [[MyFilter shareInstance] loginWithCompletion:^(BOOL loginSuccess) {
        if(loginSuccess){
            [self dismissViewControllerAnimated:YES completion:^{
//                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:[MyFilter shareInstance].storyboardName bundle:nil];
//                        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"com.main"];
//                        [[MyFilter shareInstance] setMainViewController:vc];
            }];
        }
    }];

    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:[MyFilter shareInstance].storyboardName bundle:nil];
//    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"com.main"];
//    [[MyFilter shareInstance] setMainViewController:vc];
}
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
