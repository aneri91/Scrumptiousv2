//
//  ItemListViewController.h
//  Scrumptious
//
//  Created by Karan Patel on 05/07/16.
//  Copyright © 2016 Karan Patel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
@interface ItemListViewController : UIViewController<SlideNavigationControllerDelegate>{
    int count;
}
@property (strong, nonatomic) NSString *STRCategoryName;
@property (strong, nonatomic) NSString *STRCategoryID;
@property (strong, nonatomic) NSString *STRCategoryImageName;
@property (strong, nonatomic) NSString *STRNoOfQTY;

@property (strong, nonatomic) IBOutlet UILabel *LBLCategoryName;
@property (strong, nonatomic) IBOutlet UILabel *LBLNoOfQTY;

@end
