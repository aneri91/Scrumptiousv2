//
//  BrunchMenuViewController.h
//  Scrumptious
//
//  Created by Karan Patel on 14/07/16.
//  Copyright © 2016 Karan Patel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"

@interface BrunchMenuViewController : UIViewController<UIGestureRecognizerDelegate,SlideNavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *IMageview;
@end
