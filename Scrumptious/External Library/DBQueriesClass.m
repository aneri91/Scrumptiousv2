//
//  DBQueriesClass.m
//  EVENTAPP
//
//  Created by Combitech on 9/26/14.
//  Copyright (c) 2014 Combitech. All rights reserved.
//

#import "DBQueriesClass.h"
#import <sqlite3.h>
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"

@interface DBQueriesClass ()
{
  FMDatabaseQueue *DBHandleQueue;
  NSMutableArray *SelectedRecords;
    
}
@end

@implementation DBQueriesClass
@synthesize delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
   
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void)GetDBPath
{
    DBHandleQueue = [FMDatabaseQueue databaseQueueWithPath:[self databasePath]];
}

// for out Local Database path on Documents folder.
-(NSString *)databasePath
{
    NSArray *pathForDB = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [pathForDB objectAtIndex:0];
    NSString *finalPath = [documentsDirectory stringByAppendingPathComponent:@"scrumptious.sqlite"];
    return finalPath;
}


-(NSArray *)GetItemList:(NSString *)CategoryID
{
    
    SelectedRecords=[[NSMutableArray alloc]init];
    [self GetDBPath];
    [DBHandleQueue inDatabase:^(FMDatabase *db)
     {
         NSString * query = [NSString stringWithFormat:@"SELECT * FROM food_item_master where category_master_id = %@",CategoryID];
         FMResultSet *results = [db executeQuery:query];
         query=nil;
         while([results next])
         {
             NSLog(@"%@",results);
             
             
             NSString *state_id = [results stringForColumn:@"id"];
             NSString *state_name = [results stringForColumn:@"food_item_name"];
             NSString *country_id = [results stringForColumn:@"category_master_id"];
             
             NSDictionary *dict=[[NSDictionary alloc]initWithObjectsAndKeys:state_id,@"id",state_name,@"food_item_name",country_id,@"category_master_id", nil];
             [SelectedRecords addObject:dict];
         }
         [results close];
     }];
    return SelectedRecords;
}
-(NSArray *)GetItemPrice:(NSString *)CategoryID withItemID:(NSString *)FoodItemID
{
    
    SelectedRecords=[[NSMutableArray alloc]init];
    [self GetDBPath];
    [DBHandleQueue inDatabase:^(FMDatabase *db)
     {
         NSString * query = [NSString stringWithFormat:@"SELECT * FROM products where category_master_id = %@ AND food_item_id = %@ AND product_name = 'Small'",CategoryID,FoodItemID];
         FMResultSet *results = [db executeQuery:query];
         query=nil;
         while([results next])
         {
             NSLog(@"%@",results);
             
             
             NSString *RowID = [results stringForColumn:@"id"];
             NSString *Product_Name = [results stringForColumn:@"product_name"];
             NSString *food_item = [results stringForColumn:@"food_item_id"];
             NSString *category_id = [results stringForColumn:@"category_master_id"];
             NSString *Product_Price = [results stringForColumn:@"product_price"];

             NSDictionary *dict=[[NSDictionary alloc]initWithObjectsAndKeys:RowID,@"id",Product_Name,@"product_name",food_item,@"food_item_id",category_id,@"category_master_id",Product_Price,@"product_price", nil];
             [SelectedRecords addObject:dict];
         }
         [results close];
     }];
    return SelectedRecords;
}


//-(NSArray *)GetAllVideo:(NSString *)videotype
//{
//    
//    SelectedRecords=[[NSMutableArray alloc]init];
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         NSString * query = [NSString stringWithFormat:@"SELECT * FROM VideoDetail where videoType ='%@' ORDER BY createdDate DESC",videotype];
//         FMResultSet *results = [db executeQuery:query];
//         query=nil;
//         while([results next])
//         {
//             NSLog(@"%@",results);
//             
//             
//             NSString *rowID = [results stringForColumn:@"rowID"];
//             NSString *videoName = [results stringForColumn:@"videoName"];
//             NSString *videoPath = [results stringForColumn:@"videoPath"];
//             NSString *createdDate = [results stringForColumn:@"createdDate"];
//             NSString *videoType = [results stringForColumn:@"videoType"];
//             NSString *videoStatus = [results stringForColumn:@"videoStatus"];
//             NSString *uploadedDate = [results stringForColumn:@"uploadedDate"];
//             NSString *uploadedVideoID = [results stringForColumn:@"uploadedVideoID"];
//             
//             
//             NSDictionary *dict=[[NSDictionary alloc]initWithObjectsAndKeys:rowID,@"rowID",videoName,@"videoName",videoPath,@"videoPath",createdDate,@"createdDate",videoType,@"videoType",videoStatus,@"videoStatus",uploadedDate,@"uploadedDate",uploadedVideoID,@"uploadedVideoID", nil];
//             [SelectedRecords addObject:dict];
//         }
//         [results close];
//     }];
//    return SelectedRecords;
//
//}
//
//
//-(void)InsertVideo:(NSMutableArray *)responseArray
//{
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         //***************1****************//
//         [db open];
//         BOOL flag=0;
//       //  NSString *deleteQuery = [NSString stringWithFormat:@"delete FROM LinkInTable"];
//        // [db executeUpdate:deleteQuery];
//         [db beginTransaction];
//         
//         NSLog(@"%@",responseArray);
//         
//         for(int i=0; i<responseArray.count; i++)
//         {
//             
//             
//             flag= [db executeUpdate:@"Insert into VideoDetail(videoName, videoPath, createdDate,videoType,videoStatus,uploadedDate, uploadedVideoID) VALUES(:videoName, :videoPath, :createdDate, :videoType, :videoStatus, :uploadedDate, :uploadedVideoID)" withParameterDictionary:[responseArray objectAtIndex:i]];
//             
//
//             if(flag)
//             {
//                 NSLog(@"SuccessFully inserted in LinkInTable");
//             }
//             else
//             {
//                 NSLog(@"fail to insert in LinkInTable");
//                 NSLog(@"[db lastErrorMessage], [db lastError] : %@, %@", [db lastErrorMessage], [db lastError]);
//             }
//         }
//         [db commit];
//     }];
//}
//
//
//-(void)UpdateVideoStatus:(NSDictionary *)responsedict
//{
//    [self GetDBPath];
//    NSLog(@"%@",responsedict);
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         [db open];
//         BOOL flag=0;
//         [db beginTransaction];
//
//         for(int i=0;i<[responsedict count];i++)
//         {
//             flag= [db executeUpdate:[NSString stringWithFormat:@"UPDATE VideoDetail SET videoStatus = \"%@\" WHERE videoName = '%@'",[responsedict valueForKey:@"videoStatus"],[responsedict valueForKey:@"videoName"]]];
//
//             if(flag)
//             {
//                 NSLog(@"SuccessFully inserted in UserMessageListTable");
//             }
//             else
//             {
//                 NSLog(@"fail to insert in UserMessageListTable");
//                 NSLog(@"[db lastErrorMessage], [db lastError] : %@, %@", [db lastErrorMessage], [db lastError]);
//             }
//         }
//         [db commit];
//     }];
//}
//
//
//
//-(NSArray *)GetVideoSharedat:(NSString *)videotype
//{
//    
//    SelectedRecords=[[NSMutableArray alloc]init];
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         NSString * query = [NSString stringWithFormat:@"SELECT * FROM VideoDetail where videoPath ='%@'",videotype];
//         FMResultSet *results = [db executeQuery:query];
//         query=nil;
//         while([results next])
//         {
//             NSLog(@"%@",results);
//             
//             
//             NSString *rowID = [results stringForColumn:@"rowID"];
//             NSString *videoName = [results stringForColumn:@"videoName"];
//             NSString *videoPath = [results stringForColumn:@"videoPath"];
//             NSString *createdDate = [results stringForColumn:@"createdDate"];
//             NSString *videoType = [results stringForColumn:@"videoType"];
//             NSString *videoStatus = [results stringForColumn:@"videoStatus"];
//             NSString *uploadedDate = [results stringForColumn:@"uploadedDate"];
//             NSString *uploadedVideoID = [results stringForColumn:@"uploadedVideoID"];
//             
//             
//             NSDictionary *dict=[[NSDictionary alloc]initWithObjectsAndKeys:rowID,@"rowID",videoName,@"videoName",videoPath,@"videoPath",createdDate,@"createdDate",videoType,@"videoType",videoStatus,@"videoStatus",uploadedDate,@"uploadedDate",uploadedVideoID,@"uploadedVideoID", nil];
//             [SelectedRecords addObject:dict];
//         }
//         [results close];
//     }];
//    return SelectedRecords;
//}
//
//
//
//
//
//-(void )DetleteSelectedVideo:(NSString *)videoName
//{
//    
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         
//         
//         
//         NSString *query = [NSString stringWithFormat:@"delete FROM VideoDetail where videoName ='%@'",videoName];
//         NSLog(@"%@",query);
//         [db executeUpdate:query];
//    
//     }];
//    
//   
//    
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//







//#pragma mark -DataBase Insert Queries Methods
//-(void)Insert2UserTable:(NSMutableDictionary *)responseArray
//{
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         //***************1****************//
//         
//         [db open];
//         BOOL flag=0;
//         NSString *deleteQuery = [NSString stringWithFormat:@"delete FROM UserTable"];
//         [db executeUpdate:deleteQuery];
//         [db beginTransaction];
//         
//         //"fb_secret_key":"3453dgdfgdfd","linkedin_secret_key":"67868678fgfgfg","twitter_secret_key":""
//         // //linkedin_public_url  twitter_public_url
//         
//         flag= [db executeUpdate:@"Insert into UserTable (login_with,password,user_id, firstname, lastname, emailid, gender, phone, dob, aboutme, designation, industry, website,Country,City,State,Organisation,interest,latitude,longitude,DeviceId,facebook_id,LinkedIn_id,twitter_id,connected_fb,connected_linkedin,connected_twitter,sync_fb,sync_linkedin,sync_twitter,device,profile_pic,fb_secret_key,linkedin_secret_key,twitter_secret_key,linkedin_public_url,twitter_public_url) VALUES(:login_with,:password,:user_id, :firstname, :lastname, :emailid, :gender, :phone, :dob, :aboutme, :designation, :industry, :website,:country,:city,:state,:organization,:interest,:lat,:lng,:deviceId,:fb_id,:linkedin_id,:twitter_id,:connected_fb,:connected_linkedin,:connected_twitter,:sync_fb,:sync_linkedin,:sync_twitter,:device,:profile_img,:fb_secret_key,:linkedin_secret_key,:twitter_secret_key,:linkedin_public_url,:twitter_public_url)" withParameterDictionary:responseArray];
//         
//         if(flag)
//         {
//             NSLog(@"SuccessFully inserted in UserTable");
//         }
//         else
//         {
//             NSLog(@"fail to insert in UserTable");
//             NSLog(@"[db lastErrorMessage], [db lastError] : %@, %@", [db lastErrorMessage], [db lastError]);
//         }
//         
//         [db commit];
//     }];
//}
//-(void)Insert2LinkedInTable:(NSMutableArray *)responseArray
//{
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         //***************1****************//
//         [db open];
//         BOOL flag=0;
//         NSString *deleteQuery = [NSString stringWithFormat:@"delete FROM LinkInTable"];
//         [db executeUpdate:deleteQuery];
//         [db beginTransaction];
//         for(int i=0; i<responseArray.count; i++)
//         {             
//             flag= [db executeUpdate:@"Insert into LinkInTable (linkedin_id, firstname, lastname, industry, headline, location, profile_url) VALUES(:id, :firstName, :lastName, :industry, :headline, :location, :pictureUrl)" withParameterDictionary:[responseArray objectAtIndex:i]];
//             
//             if(flag)
//             {
//                 NSLog(@"SuccessFully inserted in LinkInTable");
//             }
//             else
//             {
//                 NSLog(@"fail to insert in LinkInTable");
//                 NSLog(@"[db lastErrorMessage], [db lastError] : %@, %@", [db lastErrorMessage], [db lastError]);
//             }
//         }
//         [db commit];
//     }];
//}
//-(void)Insert2FacebookTable:(NSMutableArray *)responseArray
//{
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         //***************1****************//
//         [db open];
//         BOOL flag=0;
//         NSString *deleteQuery = [NSString stringWithFormat:@"delete FROM FacebookTable"];
//         [db executeUpdate:deleteQuery];
//         [db beginTransaction];
//         for(int i=0; i<responseArray.count; i++)
//         {
//             //CREATE TABLE "FacebookTable" ("facebook_id" TEXT, "name" TEXT, "picture" TEXT)
//           flag= [db executeUpdate:@"Insert into FacebookTable (facebook_id,name,picture) VALUES(:id,:name,:picture)" withParameterDictionary:[responseArray objectAtIndex:i]];
//           
//           if(flag)
//            {
//               NSLog(@"SuccessFully inserted in FacebookTable");
//            }
//           else
//            {
//               NSLog(@"fail to insert in FacebookTable");
//               NSLog(@"[db lastErrorMessage], [db lastError] : %@, %@", [db lastErrorMessage], [db lastError]);
//            }
//         }
//         [db commit];
//     }];
//}
//-(void)Insert2TwitterTable:(NSMutableArray *)responseArray
//{
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         //***************1****************//
//         [db open];
//         BOOL flag=0;
//         NSString *deleteQuery = [NSString stringWithFormat:@"delete FROM TwitterTable"];
//         [db executeUpdate:deleteQuery];
//         [db beginTransaction];
//         for(int i=0; i<responseArray.count; i++)
//         {
//             //CREATE TABLE "TwitterTable" ("twitter_id" TEXT, "name" TEXT, "screen_name" TEXT, "followers_count" TEXT, "following" TEXT, "friends_count" TEXT, "profile_image_url" TEXT, "profile_image_url_https" TEXT, "location" TEXT)
//             
//             flag= [db executeUpdate:@"Insert into TwitterTable (twitter_id,name,screen_name,followers_count,following,friends_count,profile_image_url,profile_image_url_https,location) VALUES(:twitter_id,:name,:screen_name,:followers_count,:following,:friends_count,:profile_image_url,:profile_image_url_https,:location)" withParameterDictionary:[responseArray objectAtIndex:i]];
//             
//             if(flag)
//             {
//                 NSLog(@"SuccessFully inserted in TwitterTable");
//             }
//             else
//             {
//                 NSLog(@"fail to insert in TwitterTable");
//                 NSLog(@"[db lastErrorMessage], [db lastError] : %@, %@", [db lastErrorMessage], [db lastError]);
//             }
//         }
//         [db commit];
//     }];
//}
//-(void)Insert2LinkedInConnReqTable:(NSDictionary *)responseArray
//{
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         //***************1****************//
//         [db open];
//         BOOL flag=0;
//         NSString *deleteQuery = [NSString stringWithFormat:@"delete FROM LinkedInConnReqTable"];
//         [db executeUpdate:deleteQuery];
//         [db beginTransaction];
//          flag= [db executeUpdate:@"Insert into LinkedInConnReqTable (Login_userid,Requested_user_id,Requested_email_id) VALUES(:Login_userid,:Requested_user_id,:Requested_email_id)" withParameterDictionary:responseArray];
//             if(flag)
//             {
//                 NSLog(@"SuccessFully inserted in LinkedInConnReqTable");
//             }
//             else
//             {
//                 NSLog(@"fail to insert in LinkedInConnReqTable");
//                 NSLog(@"[db lastErrorMessage], [db lastError] : %@, %@", [db lastErrorMessage], [db lastError]);
//             }
//         
//         [db commit];
//     }];
//}
//-(void)Insert2IndustryTable:(NSArray *)responseArray
//{
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         //CREATE TABLE "IndustryTable" ("industry_id" TEXT, "industry_name" TEXT, "industry_category" TEXT)
//         [db open];
//         BOOL flag=0;
//         NSString *deleteQuery = [NSString stringWithFormat:@"delete FROM IndustryTable"];
//         [db executeUpdate:deleteQuery];
//         [db beginTransaction];
//         for (int i=0; i<responseArray.count; i++)
//         {
//             flag= [db executeUpdate:@"Insert into IndustryTable (industry_id,industry_name,industry_category) VALUES(:industry_id,:industry_name,:industry_category)" withParameterDictionary:[responseArray objectAtIndex:i]];
//             if(flag)
//             {
//                 NSLog(@"SuccessFully inserted in IndustryTable");
//             }
//             else
//             {
//                 NSLog(@"fail to insert in IndustryTable");
//                 NSLog(@"[db lastErrorMessage], [db lastError] : %@, %@", [db lastErrorMessage], [db lastError]);
//             }
//
//         }
//         
//         [db commit];
//     }];
//}
//-(void)Insert2InterestTable:(NSArray *)responseArray
//{
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//        // CREATE TABLE "InterestTable" ("interest_id" TEXT, "interest_name" TEXT)
//         [db open];
//         BOOL flag=0;
//         NSString *deleteQuery = [NSString stringWithFormat:@"delete FROM InterestTable"];
//         [db executeUpdate:deleteQuery];
//         [db beginTransaction];
//         for (int i=0; i<responseArray.count; i++)
//         {
//             flag= [db executeUpdate:@"Insert into InterestTable (interest_id,interest_name) VALUES(:interest_id,:interest_name)" withParameterDictionary:[responseArray objectAtIndex:i]];
//             if(flag)
//             {
//                 NSLog(@"SuccessFully inserted in InterestTable");
//             }
//             else
//             {
//                 NSLog(@"fail to insert in InterestTable");
//                 NSLog(@"[db lastErrorMessage], [db lastError] : %@, %@", [db lastErrorMessage], [db lastError]);
//             }
//         }
//        
//         
//         [db commit];
//     }];
//}
//-(void)Insert2MessageInTable:(NSMutableArray *)responseArray
//{
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         //***************1****************//
//         [db open];
//         BOOL flag=0;
//         NSString *deleteQuery = [NSString stringWithFormat:@"delete FROM MessageTable"];
//         [db executeUpdate:deleteQuery];
//         [db beginTransaction];
//         for(int i=0; i<responseArray.count; i++)
//         {
//             
//             flag= [db executeUpdate:@"Insert into MessageTable(user_id, firstname, lastname, profile_img,message_text,Fullname,unread_message_count,message_id) VALUES(:user_id, :firstname, :lastname, :profile_img, :message_text, :Fullname, :unread_message_count, :message_id)" withParameterDictionary:[responseArray objectAtIndex:i]];
//             
//             if(flag)
//             {
//                 NSLog(@"SuccessFully inserted in MessageTable");
//             }
//             else
//             {
//                 NSLog(@"fail to insert in MessageTable");
//                 NSLog(@"[db lastErrorMessage], [db lastError] : %@, %@", [db lastErrorMessage], [db lastError]);
//             }
//         }
//         [db commit];
//     }];
//    
//   
//    // Our delegate method is optional, so we should
//    // check that the delegate implements it
//}
//
//-(void)Insert2MessageListInTable:(NSMutableArray *)responseArray
//{
//    
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         //***************1****************//
//         [db open];
//         BOOL flag=0;
//         [db beginTransaction];
//         for(int i=0; i<responseArray.count; i++)
//         {
//             
//             flag= [db executeUpdate:@"Insert into UserMessageListTable(message_id, message_text, user_sender_id, user_receiver_id, mark_read,message_send_time,message_send_time_mili) VALUES(:message_id, :message_text, :user_sender_id, :user_receiver_id, :mark_read, :message_send_time, :message_send_time_mili)" withParameterDictionary:[responseArray objectAtIndex:i]];
//             
//             if(flag)
//             {
//                 NSLog(@"SuccessFully inserted in UserMessageListTable");
//             }
//             else
//             {
//                 NSLog(@"fail to insert in UserMessageListTable");
//                 NSLog(@"[db lastErrorMessage], [db lastError] : %@, %@", [db lastErrorMessage], [db lastError]);
//             }
//         }
//         [db commit];
//         [db close];
//     }];
//    
//    if (delegate)
//    {
//        [delegate sendCurrentMessage];
//    }
//}
//-(void)Insert2NotificationListInTable:(NSMutableArray *)responseArray AndFestID:(NSString *)Festivalid AndISFestival:(int)isFestival
//{
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         //***************1****************//
//         [db open];
//         BOOL flag=0;
//         if (isFestival==0)
//         {
//             NSString *deleteQuery = [NSString stringWithFormat:@"delete FROM NotificationListTable where event_id=%@",Festivalid];
//             [db executeUpdate:deleteQuery];
//         }
//        else
//         {
//             NSString *deleteQuery = [NSString stringWithFormat:@"delete FROM NotificationListTable where festival_id=%@",Festivalid];
//             [db executeUpdate:deleteQuery];
//         }
//         [db beginTransaction];
//         for(int i=0; i<responseArray.count; i++)
//         {
//            
//            flag= [db executeUpdate:@"Insert into NotificationListTable(notification_log_id, festival_id, event_id, category, notification_message,notification_send_time,notification_send_time_mili) VALUES(:notification_log_id, :festival_id, :event_id, :category, :notification_message, :notification_send_time, :notification_send_time_mili)" withParameterDictionary:[responseArray objectAtIndex:i]];
//             
//             if(flag)
//             {
//                 NSLog(@"SuccessFully inserted in NotificationListTable");
//             }
//             else
//             {
//                 NSLog(@"fail to insert in NotificationListTable");
//                 NSLog(@"[db lastErrorMessage], [db lastError] : %@, %@", [db lastErrorMessage], [db lastError]);
//             }
//         }
//         [db commit];
//         [db close];
//     }];
//}
//#pragma mark -DataBase update Queries Methods
//
//-(void)Update2UserTableForUserID:(NSString *)userid socialID:(NSString *)social_IDs Conn_OnOff:(NSString *)Conn_onOff AccessToken:(NSString *)AccessToken SocialType:(NSString *)Social_type LinkedIn_url:(NSString *)LinkedIn_url Twitter_url:(NSString *)Twitter_url
//{
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         //***************1****************//
//         [db open];
//         BOOL flag=0;
//         [db beginTransaction];
//         //"fb_secret_key":"3453dgdfgdfd","linkedin_secret_key":"67868678fgfgfg","twitter_secret_key":""
//
//         //@"linkedin_public_url",@"twitter_public_url"
//         
//         /* if ([Social_type isEqualToString:@"twitter"])
//         {
//             flag= [db executeUpdate:[NSString stringWithFormat:@"UPDATE UserTable SET twitter_id = \"%@\",connected_twitter = \"%@\",twitter_secret_key = \"%@\",linkedin_public_url = \"%@\",twitter_public_url = \"%@\" WHERE user_id = %@",social_IDs,Conn_onOff,AccessToken,LinkedIn_url,Twitter_url,userid]];
//         }
//         else if ([Social_type isEqualToString:@"facebook"])
//         {
//             flag= [db executeUpdate:[NSString stringWithFormat:@"UPDATE UserTable SET facebook_id = \"%@\",connected_fb = \"%@\",fb_secret_key = \"%@\",linkedin_public_url = \"%@\",twitter_public_url = \"%@\" WHERE user_id = %@",social_IDs,Conn_onOff,AccessToken,LinkedIn_url,Twitter_url,userid]];
//         }
//         else if ([Social_type isEqualToString:@"LinkedIn"])
//         {
//             flag= [db executeUpdate:[NSString stringWithFormat:@"UPDATE UserTable SET  LinkedIn_id = \"%@\",connected_linkedin = \"%@\",linkedin_secret_key = \"%@\",linkedin_public_url = \"%@\",twitter_public_url = \"%@\" WHERE user_id = %@",social_IDs,Conn_onOff,AccessToken,LinkedIn_url,Twitter_url,userid]];
//         }*/
//         
//         if ([Social_type isEqualToString:@"twitter"])
//         {
//             flag= [db executeUpdate:[NSString stringWithFormat:@"UPDATE UserTable SET twitter_id = \"%@\",connected_twitter = \"%@\",twitter_secret_key = \"%@\",twitter_public_url = \"%@\" WHERE user_id = %@",social_IDs,Conn_onOff,AccessToken,Twitter_url,userid]];
//         }
//         else if ([Social_type isEqualToString:@"facebook"])
//         {
//             flag= [db executeUpdate:[NSString stringWithFormat:@"UPDATE UserTable SET facebook_id = \"%@\",connected_fb = \"%@\",fb_secret_key = \"%@\" WHERE user_id = %@",social_IDs,Conn_onOff,AccessToken,userid]];
//         }
//         else if ([Social_type isEqualToString:@"LinkedIn"])
//         {
//             flag= [db executeUpdate:[NSString stringWithFormat:@"UPDATE UserTable SET  LinkedIn_id = \"%@\",connected_linkedin = \"%@\",linkedin_secret_key = \"%@\",linkedin_public_url = \"%@\" WHERE user_id = %@",social_IDs,Conn_onOff,AccessToken,LinkedIn_url,userid]];
//         }
//         
//         if(flag)
//         {
//             NSLog(@"SuccessFully Updated in UserTable");
//         }
//         else
//         {
//             NSLog(@"fail to Update in UserTable");
//             NSLog(@"[db lastErrorMessage], [db lastError] : %@, %@", [db lastErrorMessage], [db lastError]);
//         }
//         
//         [db commit];
//     }];
//}
//
//-(void)UpdateMessageData:(NSDictionary *)responsedict
//{
//    [self GetDBPath];
//    NSLog(@"%@",responsedict);
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         [db open];
//         BOOL flag=0;
//         [db beginTransaction];
//         
//         for(int i=0;i<[responsedict count];i++)
//         {
//             flag= [db executeUpdate:[NSString stringWithFormat:@"UPDATE MessageTable SET message_text = \"%@\",message_id = \"%@\",unread_message_count = \"%@\" WHERE user_id = %@",[[responsedict valueForKey:@"message_text"] objectAtIndex:i],[[responsedict valueForKey:@"message_id"] objectAtIndex:i],[[responsedict valueForKey:@"unread_message_count"] objectAtIndex:i],[[responsedict valueForKey:@"user_id"] objectAtIndex:i]]];
//             
//             if(flag)
//             {
//                 NSLog(@"SuccessFully inserted in MessageTable");
//             }
//             else
//             {
//                 NSLog(@"fail to insert in MessageTable");
//                 NSLog(@"[db lastErrorMessage], [db lastError] : %@, %@", [db lastErrorMessage], [db lastError]);
//             }
//         }
//         [db commit];
//     }];
//   
//}
//
//-(void)UpdateUserMessagelistData:(NSDictionary *)responsedict
//{
//    [self GetDBPath];
//    NSLog(@"%@",responsedict);
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         [db open];
//         BOOL flag=0;
//         [db beginTransaction];
//         
//         for(int i=0;i<[responsedict count];i++)
//         {
//             flag= [db executeUpdate:[NSString stringWithFormat:@"UPDATE UserMessageListTable SET message_text = \"%@\" WHERE user_id = %@",[[responsedict valueForKey:@"message_text"] objectAtIndex:i],[[responsedict valueForKey:@"user_id"] objectAtIndex:i]]];
//             
//             if(flag)
//             {
//                 NSLog(@"SuccessFully inserted in UserMessageListTable");
//             }
//             else
//             {
//                 NSLog(@"fail to insert in UserMessageListTable");
//                 NSLog(@"[db lastErrorMessage], [db lastError] : %@, %@", [db lastErrorMessage], [db lastError]);
//             }
//         }
//         [db commit];
//     }];
//}
//
//-(void)UpdateNotificationData:(NSDictionary *)responsedict
//{
//    [self GetDBPath];
//    NSLog(@"%@",responsedict);
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         [db open];
//         BOOL flag=0;
//         [db beginTransaction];
//         
//         for(int i=0;i<[responsedict count];i++)
//         {
//             flag= [db executeUpdate:[NSString stringWithFormat:@"UPDATE NotificationListTable SET message_text = \"%@\" WHERE user_id = %@",[[responsedict valueForKey:@"message_text"] objectAtIndex:i],[[responsedict valueForKey:@"user_id"] objectAtIndex:i]]];
//             
//             if(flag)
//             {
//                 NSLog(@"SuccessFully inserted in NotificationListTable");
//             }
//             else
//             {
//                 NSLog(@"fail to insert in NotificationListTable");
//                 NSLog(@"[db lastErrorMessage], [db lastError] : %@, %@", [db lastErrorMessage], [db lastError]);
//             }
//         }
//         [db commit];
//     }];
//}
//
///*-(void)UpdateSocialConnData:(NSDictionary *)responsedict
//{
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         [db open];
//         BOOL flag=0;
//         [db beginTransaction];
//       
//          flag= [db executeUpdate:[NSString stringWithFormat:@"UPDATE UserTable SET connected_fb = \"%@\",facebook_id = \"%@\",connected_linkedin = \"%@\",LinkedIn_id = \"%@\",connected_twitter = \"%@\",twitter_id = \"%@\" WHERE user_id = %@",[responsedict valueForKey:@"connected_fb"],[responsedict valueForKey:@"facebook_id"],[responsedict valueForKey:@"connected_linkedin"],[responsedict valueForKey:@"LinkedIn_id"],[responsedict valueForKey:@"connected_twitter"],[responsedict valueForKey:@"twitter_id"],[responsedict valueForKey:@"user_id"]]];
//    
//         if(flag)
//         {
//             NSLog(@"SuccessFully inserted in UserTable");
//         }
//         else
//         {
//             NSLog(@"fail to insert in UserTable");
//             NSLog(@"[db lastErrorMessage], [db lastError] : %@, %@", [db lastErrorMessage], [db lastError]);
//         }
//         
//         [db commit];
//     }];
//}*/
//#pragma mark - Database Select Queries Methods
//-(NSArray *) Get_MySocial_IDs
//{
//    SelectedRecords=[[NSMutableArray alloc]init];
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         NSString * query = @"SELECT facebook_id,linkedin_id,twitter_id FROM UserTable";
//         FMResultSet *results = [db executeQuery:query];
//         query=nil;
//         while([results next])
//         {
//             NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
//             
//             NSString *facebook_id = [results stringForColumn:@"facebook_id"];
//             NSString *linkedin_id = [results stringForColumn:@"linkedin_id"];
//             NSString *twitter_id = [results stringForColumn:@"twitter_id"];
//             
//             if(facebook_id.length>0)
//              {
//                 [dict setObject:facebook_id forKey:@"facebook_id"];
//              }
//             else
//              {
//                  [dict setObject:@"" forKey:@"facebook_id"];
//              }
//             
//             if(linkedin_id.length>0)
//              {
//                 [dict setObject:linkedin_id forKey:@"linkedin_id"];
//              }
//             else
//              {
//                 [dict setObject:@"" forKey:@"linkedin_id"];
//              }
//             
//             if(twitter_id.length>0)
//              {
//                 [dict setObject:twitter_id forKey:@"twitter_id"];
//              }
//             else
//              {
//                 [dict setObject:twitter_id forKey:@"twitter_id"];
//              }
//             
//             SelectedRecords =[dict copy];
//         }
//         [results close];
//     }];
//    if (SelectedRecords.count==0)
//    {
//        NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
//        [dict setObject:@"" forKey:@"facebook_id"];
//        [dict setObject:@"" forKey:@"linkedin_id"];
//        [dict setObject:@"" forKey:@"twitter_id"];
//        SelectedRecords =[dict copy];
//    }
//    return SelectedRecords;
//}
//
//-(NSArray *) GetAllLinkedInconnection
//{
//   SelectedRecords=[[NSMutableArray alloc]init];
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         NSString * query = @"SELECT linkedin_id FROM LinkInTable";
//         FMResultSet *results = [db executeQuery:query];
//         query=nil;
//         while([results next])
//         {
//             NSString *linkedin_id = [results stringForColumn:@"linkedin_id"];
//            [SelectedRecords addObject:linkedin_id];
//         }
//         [results close];
//     }];
//    return SelectedRecords;
//}
//-(NSArray *) GetAllFacebookConnection
//{
//    SelectedRecords=[[NSMutableArray alloc]init];
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         NSString * query = @"SELECT facebook_id FROM FacebookTable";
//         FMResultSet *results = [db executeQuery:query];
//         query=nil;
//         while([results next])
//         {
//             NSString *facebook_id = [results stringForColumn:@"facebook_id"];
//             [SelectedRecords addObject:facebook_id];
//         }
//         [results close];
//     }];
//    return SelectedRecords;
//}
//-(NSArray *) GetAllTwitterConnection
//{
//    SelectedRecords=[[NSMutableArray alloc]init];
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         NSString * query = @"SELECT screen_name FROM TwitterTable";
//         FMResultSet *results = [db executeQuery:query];
//         query=nil;
//         while([results next])
//         {
//             NSString *twitter_id = [results stringForColumn:@"screen_name"];
//             [SelectedRecords addObject:twitter_id];
//         }
//         [results close];
//     }];
//    return SelectedRecords;
//}
//-(NSArray *)GetAllTwitterConnection_IDs
//{
//    SelectedRecords=[[NSMutableArray alloc]init];
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         NSString * query = @"SELECT twitter_id FROM TwitterTable";
//         FMResultSet *results = [db executeQuery:query];
//         query=nil;
//         while([results next])
//         {
//             NSString *twitter_id = [results stringForColumn:@"twitter_id"];
//             [SelectedRecords addObject:twitter_id];
//         }
//         [results close];
//     }];
//    return SelectedRecords;
//}
//-(NSArray *)GetAllTwitterConnection_screen_name
//{
//    SelectedRecords=[[NSMutableArray alloc]init];
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         NSString * query = @"SELECT screen_name FROM TwitterTable";
//         FMResultSet *results = [db executeQuery:query];
//         query=nil;
//         while([results next])
//         {
//             NSString *twitter_id = [results stringForColumn:@"screen_name"];
//             [SelectedRecords addObject:twitter_id];
//         }
//         [results close];
//     }];
//    return SelectedRecords;
//}
//-(NSArray *)GetAllLinkedInConnReqForUser:(NSString *)User_id
//{
//    SelectedRecords=[[NSMutableArray alloc]init];
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         NSString * query = [NSString stringWithFormat:@"SELECT Requested_user_id FROM LinkedInConnReqTable where Login_userid = '%@'",User_id];
//         FMResultSet *results = [db executeQuery:query];
//         query=nil;
//         while([results next])
//         {
//             NSString *Login_user_email = [results stringForColumn:@"Requested_user_id"];
//             [SelectedRecords addObject:Login_user_email];
//         }
//         [results close];
//     }];
//    return SelectedRecords;
//}
//
//
//-(NSArray *)GetAllInterestList
//{
//    // CREATE TABLE "InterestTable" ("interest_id" TEXT, "interest_name" TEXT)
//    SelectedRecords=[[NSMutableArray alloc]init];
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         NSString * query = [NSString stringWithFormat:@"SELECT * FROM InterestTable"];
//         FMResultSet *results = [db executeQuery:query];
//         query=nil;
//         while([results next])
//         {
//             NSString *interest_id = [results stringForColumn:@"interest_id"];
//             NSString *interest_name = [results stringForColumn:@"interest_name"];
//             NSDictionary *dict=[[NSDictionary alloc]initWithObjectsAndKeys:interest_id,@"interest_id",interest_name,@"interest_name", nil];
//             [SelectedRecords addObject:dict];
//         }
//         [results close];
//     }];
//    return SelectedRecords;
//}
//
//
//
//
//
//#pragma mark - Database delete Queries Methods
//-(NSArray *)DeleteRecordForUserId:(NSString *)User_id
//{
//    SelectedRecords=[[NSMutableArray alloc]init];
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         [db open];
//         NSString *deleteQuery = [NSString stringWithFormat:@"delete FROM LinkedInConnReqTable where Requested_user_id = '%@'",User_id];
//         [db executeUpdate:deleteQuery];
//         [db commit];
//     }];
//    return SelectedRecords;
//}
//-(NSArray *)FlushAllDataForCurrentUser
//{
//    SelectedRecords=[[NSMutableArray alloc]init];
//    [self GetDBPath];
//    [DBHandleQueue inDatabase:^(FMDatabase *db)
//     {
//         [db open];
//         [db beginTransaction];
//         NSString *deleteQuery1 = [NSString stringWithFormat:@"delete FROM UserTable"];
//         [db executeUpdate:deleteQuery1];
//         
//         NSString *deleteQuery2 = [NSString stringWithFormat:@"delete FROM FacebookTable"];
//         [db executeUpdate:deleteQuery2];
//         
//         NSString *deleteQuery3 = [NSString stringWithFormat:@"delete FROM LinkInTable"];
//         [db executeUpdate:deleteQuery3];
//         
//         NSString *deleteQuery4 = [NSString stringWithFormat:@"delete FROM TwitterTable"];
//         [db executeUpdate:deleteQuery4];
//         
//         NSString *deleteQuery5 = [NSString stringWithFormat:@"delete FROM MessageTable"];
//         [db executeUpdate:deleteQuery5];
//         
//         NSString *deleteQuery6 = [NSString stringWithFormat:@"delete FROM UserMessageListTable"];
//         [db executeUpdate:deleteQuery6];
//         
//         NSString *deleteQuery7 = [NSString stringWithFormat:@"delete FROM NotificationListTable"];
//         [db executeUpdate:deleteQuery7];
//         
//        // NSString *deleteQuery8 = [NSString stringWithFormat:@"delete FROM LinkedInConnReqTable"];
//        // [db executeUpdate:deleteQuery8];
//         
//         [db commit];
//     }];
//    return SelectedRecords;
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
