//
//  ItemListViewController.m
//  Scrumptious
//
//  Created by Karan Patel on 05/07/16.
//  Copyright © 2016 Karan Patel. All rights reserved.
//

#import "ItemListViewController.h"
#import "CartViewController.h"
#import "ItemCell.h"
#import "DBQueriesClass.h"

@interface ItemListViewController ()
{
     DBQueriesClass *DBQC;
    NSMutableArray *itemList;
}
@end

@implementation ItemListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    DBQC=[[DBQueriesClass alloc]init];
    
    itemList = [[NSMutableArray alloc]init];
    itemList = [DBQC GetItemList:[NSString stringWithFormat:@"%f",[_STRCategoryID doubleValue] + 1]];
    NSLog(@"item list :- %@",itemList);

    self.LBLCategoryName.text = self.STRCategoryName;
    count = 00;
    _LBLNoOfQTY.text = [NSString stringWithFormat:@"%d",count];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)btnToProvious:(id)sender
{
    [[self navigationController]popViewControllerAnimated:YES];
}
-(IBAction)btnAddToCart:(id)sender
{
    CartViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"CartView"];
    [self.navigationController pushViewController:vc animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"ItemCell";
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.imageView1.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_STRCategoryImageName]];
    cell.TxtPrice.userInteractionEnabled = false;
    cell.TxtQty.keyboardType = UIKeyboardTypeNumberPad;
    cell.LBLName.text = [[itemList objectAtIndex:indexPath.row] valueForKey:@"food_item_name"];
    [cell.BtnAddToCart setTag:indexPath.row+1000];
    [cell.BtnNext setTag:indexPath.row+1000];
    [cell.BtnPrevious setTag:indexPath.row+1000];

    
    NSString *str = [[itemList objectAtIndex:indexPath.row] valueForKey:@"id"];
    NSArray *ItemData = [[NSArray alloc]init];
    
   ItemData = [DBQC GetItemPrice:[NSString stringWithFormat:@"%f",[_STRCategoryID doubleValue] + 1] withItemID:str];
    NSLog(@"%@",ItemData);
    cell.TxtPrice.text = [[ItemData objectAtIndex:0]valueForKey:@"product_price"];
    
    [cell.BtnAddToCart addTarget:self action:@selector(btnAddItemToCart:) forControlEvents:UIControlEventTouchUpInside];
    [cell.BtnPrevious addTarget:self action:@selector(btnAddItemToCart:) forControlEvents:UIControlEventTouchUpInside];
    [cell.BtnNext addTarget:self action:@selector(btnAddItemToCart:) forControlEvents:UIControlEventTouchUpInside];

    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        count = count - 1;
        _LBLNoOfQTY.text = [NSString stringWithFormat:@"%d",count];
    }
    
}
-(IBAction)btnAddItemToCart:(id)sender
{
    count = count + 1;
    _LBLNoOfQTY.text = [NSString stringWithFormat:@"%d",count];
    
}
-(IBAction)btnNext:(id)sender
{
    
}

-(IBAction)btnPrevious:(id)sender
{
    
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
