//
//  LeftMenuViewController.m
//  Clokkit
//
//  Created by Ashvin Patel on 29/12/15.
//  Copyright (c) 2015 home. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "SlideNavigationController.h"
#import "ContactViewController.h"
#import "HomeViewController.h"
#import "BrunchMenuViewController.h"

@interface LeftMenuViewController ()

@end

@implementation LeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)btnContactUS:(id)sender
{
    
    CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
    
    if (iOSDeviceScreenSize.height == 667)
    {
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main_Iphone6" bundle: nil];
        ContactViewController *controller = (ContactViewController *)[mainStoryboard instantiateViewControllerWithIdentifier: @"ContactView"];
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:controller
                                                             withSlideOutAnimation:YES
                                                                     andCompletion:nil];
    }else if (iOSDeviceScreenSize.height == 736){
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main_Iphone6Plus" bundle: nil];
        ContactViewController *controller = (ContactViewController *)[mainStoryboard instantiateViewControllerWithIdentifier: @"ContactView"];
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:controller
                                                                 withSlideOutAnimation:YES
                                                                         andCompletion:nil];
        
    }else{
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        ContactViewController *controller = (ContactViewController *)[mainStoryboard instantiateViewControllerWithIdentifier: @"ContactView"];
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:controller
                                                                 withSlideOutAnimation:YES
                                                                         andCompletion:nil];
        
    }
    
}
-(IBAction)btnLogout:(id)sender
{
    CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;

    if (iOSDeviceScreenSize.height == 667)
    {
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main_Iphone6" bundle: nil];
        HomeViewController *controller = (HomeViewController *)[mainStoryboard instantiateViewControllerWithIdentifier: @"HomeView"];
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:controller
                                                                 withSlideOutAnimation:YES
                                                                         andCompletion:nil];
    }else if (iOSDeviceScreenSize.height == 736){
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main_Iphone6Plus" bundle: nil];
        HomeViewController *controller = (HomeViewController *)[mainStoryboard instantiateViewControllerWithIdentifier: @"HomeView"];
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:controller
                                                                 withSlideOutAnimation:YES
                                                                         andCompletion:nil];
        
    }else{
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        HomeViewController *controller = (HomeViewController *)[mainStoryboard instantiateViewControllerWithIdentifier: @"HomeView"];
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:controller
                                                                 withSlideOutAnimation:YES
                                                                         andCompletion:nil];
    }
    
    
 
    
}
-(IBAction)btnCategory:(id)sender
{
    
    CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
    
    if (iOSDeviceScreenSize.height == 667)
    {
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main_Iphone6" bundle: nil];
        HomeViewController *controller = (HomeViewController *)[mainStoryboard instantiateViewControllerWithIdentifier: @"HomeView"];
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:controller
                                                                 withSlideOutAnimation:YES
                                                                         andCompletion:nil];
    }else if (iOSDeviceScreenSize.height == 736){
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main_Iphone6Plus" bundle: nil];
        HomeViewController *controller = (HomeViewController *)[mainStoryboard instantiateViewControllerWithIdentifier: @"HomeView"];
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:controller
                                                                 withSlideOutAnimation:YES
                                                                         andCompletion:nil];
        
    }else{
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        HomeViewController *controller = (HomeViewController *)[mainStoryboard instantiateViewControllerWithIdentifier: @"HomeView"];
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:controller
                                                                 withSlideOutAnimation:YES
                                                                         andCompletion:nil];
    }
    
    
    
    
    
   
    
    
}

-(IBAction)btnBrunchMenu:(id)sender
{
    
    CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
    
    if (iOSDeviceScreenSize.height == 667)
    {
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main_Iphone6" bundle: nil];
        BrunchMenuViewController *controller = (BrunchMenuViewController *)[mainStoryboard instantiateViewControllerWithIdentifier: @"BrunchMenu"];
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:controller
                                                                 withSlideOutAnimation:YES
                                                                         andCompletion:nil];
    }else if (iOSDeviceScreenSize.height == 736){
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main_Iphone6Plus" bundle: nil];
        BrunchMenuViewController *controller = (BrunchMenuViewController *)[mainStoryboard instantiateViewControllerWithIdentifier: @"BrunchMenu"];
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:controller
                                                                 withSlideOutAnimation:YES
                                                                         andCompletion:nil];
        
    }else{
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        BrunchMenuViewController *controller = (BrunchMenuViewController *)[mainStoryboard instantiateViewControllerWithIdentifier: @"BrunchMenu"];
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:controller
                                                                 withSlideOutAnimation:YES
                                                                         andCompletion:nil];
        
    }
}
@end
