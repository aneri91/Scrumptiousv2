//
//  GuestLoginViewController.m
//  Scrumptious
//
//  Created by Karan Patel on 04/07/16.
//  Copyright © 2016 Karan Patel. All rights reserved.
//

#import "GuestLoginViewController.h"

@interface GuestLoginViewController ()

@end

@implementation GuestLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(IBAction)btnToProvious:(id)sender
{
    [[self navigationController]popViewControllerAnimated:YES];
    
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
