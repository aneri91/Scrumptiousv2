//
//  HomeViewController.m
//  Scrumptious
//
//  Created by Karan Patel on 05/07/16.
//  Copyright © 2016 Karan Patel. All rights reserved.
//

#import "HomeViewController.h"
#import "ItemListViewController.h"
#import "HomeCategoryCell.h"
#import "ContactViewController.h"
#import "CartViewController.h"
#import "SlideNavigationController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _CategoryArray = [[NSArray alloc]initWithObjects:@"ESPRESSO",@"COFFEE & TEA",@"SANDWICHES",@"LUNCH & DINNER",@"BURRITOS/OMELETS",@"SCRAMBLER WRAPS",@"PANCAKES",@"SIDES",@"NITRO CREAM",@"FROGEN YOGURT",@"FRUIT SMOTHIES",@"GREEN SMOTHIES",@"HOT CHOCOLATES",@"BOTTLED DRINKS",@"MILK SHAKES", nil];
    
    
    _CategoryImgArray = [[NSArray alloc]initWithObjects:@"ESPRESSO",@"COFFEETEA",@"SANDWICHES",@"LUNCHDINNER",@"BURRITOS",@"SCRAMBLER",@"PANCAKES",@"SIDES",@"NITROCREAM",@"FROGEN",@"FRUIT",@"GREEN",@"HOTCHOCOLATES",@"BOTTLED",@"MILKSHAKE", nil];
    

    
    isLeftSideViewOpen = true;
    [ItemCategoryCollectionView registerClass:[UICollectionViewCell class]forCellWithReuseIdentifier:@"Cell"];
    [ItemCategoryCollectionView setBackgroundColor:[UIColor clearColor]];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)btnAddToCart:(id)sender
{
    CartViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"CartView"];
    [self.navigationController pushViewController:vc animated:YES];
}
-(IBAction)btnToProvious:(id)sender
{
    [[self navigationController]popViewControllerAnimated:YES];
    
}

-(IBAction)btnMenu:(id)sender
{
    [[SlideNavigationController sharedInstance] toggleLeftMenu];

}

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu{
    return YES;
}

- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _CategoryArray.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    HomeCategoryCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"HomeCategory" forIndexPath:indexPath];
    cell.LBLName.text = [self.CategoryArray objectAtIndex:indexPath.row];
    cell.imageView1.image =[UIImage imageNamed:[self.CategoryImgArray objectAtIndex:indexPath.row]];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ItemListViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ItemListView"];
    vc.STRCategoryName = [self.CategoryArray objectAtIndex:indexPath.row];
    vc.STRCategoryID = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    vc.STRCategoryImageName = [NSString stringWithFormat:@"%@",[_CategoryImgArray objectAtIndex:indexPath.row ]];

    [self.navigationController pushViewController:vc animated:YES];
}


//ItemListView
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
