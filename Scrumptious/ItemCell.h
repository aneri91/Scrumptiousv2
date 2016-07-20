//
//  ItemCell.h
//  Scrumptious
//
//  Created by Karan Patel on 06/07/16.
//  Copyright © 2016 Karan Patel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UIImageView *imageView1;
@property (nonatomic, strong) IBOutlet UILabel *LBLName;
@property (nonatomic, strong) IBOutlet UILabel *LBLSize;
@property (nonatomic, strong) IBOutlet UITextField *TxtQty;
@property (nonatomic, strong) IBOutlet UITextField *TxtPrice;
@property (nonatomic, strong) IBOutlet UIButton *BtnAddToCart;
@property (nonatomic, strong) IBOutlet UIButton *BtnPrevious;
@property (nonatomic, strong) IBOutlet UIButton *BtnNext;

@end
