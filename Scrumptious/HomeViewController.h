//
//  HomeViewController.h
//  Scrumptious
//
//  Created by Karan Patel on 05/07/16.
//  Copyright © 2016 Karan Patel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"

@interface HomeViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,SlideNavigationControllerDelegate>

{
    BOOL isLeftSideViewOpen;
    IBOutlet UICollectionView *ItemCategoryCollectionView;

}
@property (strong, nonatomic) IBOutlet UIImageView *SideMenuImg;
@property (strong, nonatomic) IBOutlet UIView *SideMenuBackView;
@property (strong, nonatomic) IBOutlet UIView *MainBackView;
@property (strong, nonatomic) IBOutlet UIView *AllBackView;
@property (strong, nonatomic) NSArray *CategoryArray;
@property (strong, nonatomic) NSArray *CategoryImgArray;


@end
