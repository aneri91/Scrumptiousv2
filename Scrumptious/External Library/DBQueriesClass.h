//
//  DBQueriesClass.h
//  EVENTAPP
//
//  Created by Combitech on 9/26/14.
//  Copyright (c) 2014 Combitech. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DBQueriesClassrDelegate <NSObject>
@required
- (void)sendCurrentMessage;
@end


@interface DBQueriesClass : UIViewController

@property (nonatomic, weak) id<DBQueriesClassrDelegate> delegate;


-(NSMutableArray *)GetItemList:(NSString *)CategoryID;
-(NSArray *)GetItemPrice:(NSString *)CategoryID withItemID:(NSString *)FoodItemID;



@end


