//
//  BrunchMenuViewController.m
//  Scrumptious
//
//  Created by Karan Patel on 14/07/16.
//  Copyright © 2016 Karan Patel. All rights reserved.
//

#import "BrunchMenuViewController.h"

@interface BrunchMenuViewController ()

@end

@implementation BrunchMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [_IMageview setBounds:CGRectMake(0.0, 0.0, 120.0, 120.0)];
    [_IMageview setCenter:self.view.center];
    [_IMageview setUserInteractionEnabled:YES]; // <--- This is very important
    
    // create and configure the pinch gesture
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGestureDetected:)];
    [pinchGestureRecognizer setDelegate:self];
    [_IMageview addGestureRecognizer:pinchGestureRecognizer];
    
    // create and configure the rotation gesture
    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationGestureDetected:)];
    [rotationGestureRecognizer setDelegate:self];
    [_IMageview addGestureRecognizer:rotationGestureRecognizer];
    
    // creat and configure the pan gesture
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureDetected:)];
    [panGestureRecognizer setDelegate:self];
    [_IMageview addGestureRecognizer:panGestureRecognizer];
}


- (void)pinchGestureDetected:(UIPinchGestureRecognizer *)recognizer
{
    UIGestureRecognizerState state = [recognizer state];
    
    if (state == UIGestureRecognizerStateBegan || state == UIGestureRecognizerStateChanged)
    {
        CGFloat scale = [recognizer scale];
        [recognizer.view setTransform:CGAffineTransformScale(recognizer.view.transform, scale, scale)];
        [recognizer setScale:1.0];
    }
}



- (void)panGestureDetected:(UIPanGestureRecognizer *)recognizer
{
//    UIGestureRecognizerState state = [recognizer state];
//    
//    if (state == UIGestureRecognizerStateBegan || state == UIGestureRecognizerStateChanged)
//    {
//        CGPoint translation = [recognizer translationInView:recognizer.view];
//        [recognizer.view setTransform:CGAffineTransformTranslate(recognizer.view.transform, translation.x, translation.y)];
//        [recognizer setTranslation:CGPointZero inView:recognizer.view];
//    }
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)btnToProvious:(id)sender
{
    [[self navigationController]popViewControllerAnimated:YES];
    
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
