//
//  CheckOutViewController.m
//  Scrumptious
//
//  Created by Karan Patel on 07/07/16.
//  Copyright © 2016 Karan Patel. All rights reserved.
//

#import "CheckOutViewController.h"
#import "ViewController.h"
#import "GuestLoginViewController.h"
#import "SignUpViewController.h"
@interface CheckOutViewController ()

@end

@implementation CheckOutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)btnSignUp:(id)sender
{
    SignUpViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SignUpView"];
    [self.navigationController pushViewController:vc animated:YES];
}
-(IBAction)BtnGuestUser:(id)sender
{
    GuestLoginViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GuestLoginView"];
    [self.navigationController pushViewController:vc animated:YES];
}
-(IBAction)BtnScrumptionUser:(id)sender
{
    ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginView"];
    [self.navigationController pushViewController:vc animated:YES];
}
-(IBAction)btnToProvious:(id)sender
{
    [[self navigationController]popViewControllerAnimated:YES];
    
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
