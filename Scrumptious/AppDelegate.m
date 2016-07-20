//
//  AppDelegate.m
//  Scrumptious
//
//  Created by Karan Patel on 03/07/16.
//  Copyright © 2016 Karan Patel. All rights reserved.
//

#import "AppDelegate.h"
#import "IQKeyboardManager.h"
#import "LeftMenuViewController.h"
#import "SlideNavigationController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [NSThread sleepForTimeInterval:5.0];
    CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
    
    if (iOSDeviceScreenSize.height == 480)
    {
        UIStoryboard *iPhone45Storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *initialViewController = [iPhone45Storyboard instantiateInitialViewController];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController  = initialViewController;
        [self.window makeKeyAndVisible];
        LeftMenuViewController *leftMenu = (LeftMenuViewController*)[iPhone45Storyboard
                                                                     instantiateViewControllerWithIdentifier: @"LeftMenuViewController"];
        [SlideNavigationController sharedInstance].leftMenu = leftMenu;
        
        [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidClose object:nil queue:nil usingBlock:^(NSNotification *note) {
            NSString *menu = note.userInfo[@"menu"];
            NSLog(@"Closed %@", menu);
        }];
        
        [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidOpen object:nil queue:nil usingBlock:^(NSNotification *note) {
            NSString *menu = note.userInfo[@"menu"];
            NSLog(@"Opened %@", menu);
        }];
        
        [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidReveal object:nil queue:nil usingBlock:^(NSNotification *note) {
            NSString *menu = note.userInfo[@"menu"];
            NSLog(@"Revealed %@", menu);
        }];
        
    }else if (iOSDeviceScreenSize.height == 667){
        UIStoryboard *iPhone45Storyboard = [UIStoryboard storyboardWithName:@"Main_Iphone6" bundle:nil];
        UIViewController *initialViewController = [iPhone45Storyboard instantiateInitialViewController];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController  = initialViewController;
        [self.window makeKeyAndVisible];
        LeftMenuViewController *leftMenu = (LeftMenuViewController*)[iPhone45Storyboard
                                                                     instantiateViewControllerWithIdentifier: @"LeftMenuViewController"];
        [SlideNavigationController sharedInstance].leftMenu = leftMenu;
        
        [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidClose object:nil queue:nil usingBlock:^(NSNotification *note) {
            NSString *menu = note.userInfo[@"menu"];
            NSLog(@"Closed %@", menu);
        }];
        
        [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidOpen object:nil queue:nil usingBlock:^(NSNotification *note) {
            NSString *menu = note.userInfo[@"menu"];
            NSLog(@"Opened %@", menu);
        }];
        
        [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidReveal object:nil queue:nil usingBlock:^(NSNotification *note) {
            NSString *menu = note.userInfo[@"menu"];
            NSLog(@"Revealed %@", menu);
        }];
    }else if (iOSDeviceScreenSize.height == 736){
        UIStoryboard *iPhone45Storyboard = [UIStoryboard storyboardWithName:@"Main_Iphone6Plus" bundle:nil];
        UIViewController *initialViewController = [iPhone45Storyboard instantiateInitialViewController];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController  = initialViewController;
        [self.window makeKeyAndVisible];
        
        LeftMenuViewController *leftMenu = (LeftMenuViewController*)[iPhone45Storyboard
                                                                     instantiateViewControllerWithIdentifier: @"LeftMenuViewController"];
        [SlideNavigationController sharedInstance].leftMenu = leftMenu;
        
        [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidClose object:nil queue:nil usingBlock:^(NSNotification *note) {
            NSString *menu = note.userInfo[@"menu"];
            NSLog(@"Closed %@", menu);
        }];
        
        [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidOpen object:nil queue:nil usingBlock:^(NSNotification *note) {
            NSString *menu = note.userInfo[@"menu"];
            NSLog(@"Opened %@", menu);
        }];
        
        [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidReveal object:nil queue:nil usingBlock:^(NSNotification *note) {
            NSString *menu = note.userInfo[@"menu"];
            NSLog(@"Revealed %@", menu);
        }];
    }
    else{
        UIStoryboard *iPhone45Storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *initialViewController = [iPhone45Storyboard instantiateInitialViewController];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController  = initialViewController;
        [self.window makeKeyAndVisible];
        
        LeftMenuViewController *leftMenu = (LeftMenuViewController*)[iPhone45Storyboard
                                                                     instantiateViewControllerWithIdentifier: @"LeftMenuViewController"];
        [SlideNavigationController sharedInstance].leftMenu = leftMenu;
        
        [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidClose object:nil queue:nil usingBlock:^(NSNotification *note) {
            NSString *menu = note.userInfo[@"menu"];
            NSLog(@"Closed %@", menu);
        }];
        
        [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidOpen object:nil queue:nil usingBlock:^(NSNotification *note) {
            NSString *menu = note.userInfo[@"menu"];
            NSLog(@"Opened %@", menu);
        }];
        
        [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidReveal object:nil queue:nil usingBlock:^(NSNotification *note) {
            NSString *menu = note.userInfo[@"menu"];
            NSLog(@"Revealed %@", menu);
        }];
    }
    
    
    [[IQKeyboardManager sharedManager] setEnable:YES];
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];
    [[IQKeyboardManager sharedManager] setShouldShowTextFieldPlaceholder:YES];
    
    [self copyDataBaseFile];

    
    
    
    return YES;
}

-(void)copyDataBaseFile
{
    BOOL success;
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"scrumptious.sqlite"];
    success = [fileManager fileExistsAtPath:writableDBPath];
    
    if (success) return;
    // The writable database does not exist, so copy the default to the appropriate location.
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"scrumptious.sqlite"];
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success) {
        NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
