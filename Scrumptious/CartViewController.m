//
//  CartViewController.m
//  Scrumptious
//
//  Created by Karan Patel on 06/07/16.
//  Copyright © 2016 Karan Patel. All rights reserved.
//

#import "CartViewController.h"
#import "ItemCell.h"
#import "CheckOutViewController.h"
@interface CartViewController ()

@end

@implementation CartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)btnCheckOut:(id)sender
{
    CheckOutViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"CheckOutView"];
    [self.navigationController pushViewController:vc animated:YES];
}
-(IBAction)btnToProvious:(id)sender
{
    [[self navigationController]popViewControllerAnimated:YES];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"ItemCell";
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0;
}
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu{
    return YES;
}

- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
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
