//
//  ViewController.m
//  Scrumptious
//
//  Created by Karan Patel on 03/07/16.
//  Copyright © 2016 Karan Patel. All rights reserved.
//

#import "ViewController.h"
#import "GuestLoginViewController.h"
#import "HomeViewController.h"
#import "OrderDetailsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(IBAction)btnAddToCart:(id)sender
{
    HomeViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeView"];
    [self.navigationController pushViewController:vc animated:YES];
}
-(IBAction)btnToProvious:(id)sender
{
    [[self navigationController]popViewControllerAnimated:YES];
    
}
-(IBAction)btnSubmit:(id)sender
{
    OrderDetailsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"OrderDetailsView"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
