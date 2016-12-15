//
//  CSOCViewController.m
//  FMYCS
//
//  Created by xuewu.long on 16/12/1.
//  Copyright © 2016年 fmylove. All rights reserved.
//

#import "CSOCViewController.h"

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
