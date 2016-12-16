//
//  CSOCViewController.m
//  FMYCS
//
//  Created by xuewu.long on 16/12/1.
//  Copyright © 2016年 fmylove. All rights reserved.
//

#import "CSOCViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface CSOCViewController ()

@end

@implementation CSOCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
//    self.navigationController.navigationBar.translucent
    
//    [bar lt_setBackgroundColor:[UIColor colorWithRed:254 green:254 blue:254]];

    UINavigationBar *bar = [UINavigationBar appearance];
    bar = self.navigationController.navigationBar;
    
    
    
    UILabel *label = [[UILabel alloc] init];
    id obj = NSClassFromString(@"UILabel");
    label = [[[obj class] alloc] init];
    NSString *className =  NSStringFromClass([label class]);
    NSLog(@"%@",className);
    
    
    [self performSelectorOnMainThread:@selector(showHintInfo) withObject:self waitUntilDone:YES];


}

- (void)showHintInfo {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
