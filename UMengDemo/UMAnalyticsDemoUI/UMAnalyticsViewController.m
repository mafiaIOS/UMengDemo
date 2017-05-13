//
//  UMAnalyticsViewController.m
//  UMengDemo
//
//  Created by wangkai on 17/4/13.
//  Copyright © 2017年 UMeng. All rights reserved.
//

#import "UMAnalyticsViewController.h"
#import "UMAnalyticsDplusViewController.h"
#import <UMAnalytics/MobClick.h>

@implementation UMAnalyticsViewController
- (void)viewDidLoad {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, [UMAnalyticsViewController getScreenWidth], 40)];
    label.font = [UIFont systemFontOfSize:16.f];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"UMAnalytics Demo";
    label.backgroundColor=[UIColor colorWithRed:141/255.0 green:166/255.0 blue:196/255.0 alpha:1.0];
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];

    
    UIButton *eventButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [eventButton setFrame:CGRectMake(0, 70, [UMAnalyticsViewController getScreenWidth]/2-5, 40)];
    [eventButton setBackgroundColor:[UIColor colorWithRed:141/255.0 green:166/255.0 blue:196/255.0 alpha:1.0]];
    [eventButton.layer setCornerRadius:5.0];
    [eventButton setTitle:@"event" forState:UIControlStateNormal];
    [eventButton addTarget:self action:@selector(eventButtonClick) forControlEvents:UIControlEventTouchUpInside];
    eventButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    [self.view addSubview:eventButton];
    
    UIButton *eventAButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [eventAButton setFrame:CGRectMake([UMAnalyticsViewController getScreenWidth]/2+5, 70, [UMAnalyticsViewController getScreenWidth]/2-5, 40)];
    [eventAButton setBackgroundColor:[UIColor colorWithRed:141/255.0 green:166/255.0 blue:196/255.0 alpha:1.0]];
    [eventAButton.layer setCornerRadius:5.0];
    [eventAButton setTitle:@"event A" forState:UIControlStateNormal];
    [eventAButton addTarget:self action:@selector(eventAButtonClick) forControlEvents:UIControlEventTouchUpInside];
    eventAButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    [self.view addSubview:eventAButton];
    
    UIButton *errorButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [errorButton setFrame:CGRectMake(0, 120, [UMAnalyticsViewController getScreenWidth]/2-5, 40)];
    [errorButton setBackgroundColor:[UIColor colorWithRed:141/255.0 green:166/255.0 blue:196/255.0 alpha:1.0]];
    [errorButton.layer setCornerRadius:5.0];
    [errorButton setTitle:@"error" forState:UIControlStateNormal];
    [errorButton addTarget:self action:@selector(errorButtonClick) forControlEvents:UIControlEventTouchUpInside];
    errorButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    [self.view addSubview:errorButton];
    
    UIButton *signInButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [signInButton setFrame:CGRectMake([UMAnalyticsViewController getScreenWidth]/2+5, 120, [UMAnalyticsViewController getScreenWidth]/2-5, 40)];
    [signInButton setBackgroundColor:[UIColor colorWithRed:141/255.0 green:166/255.0 blue:196/255.0 alpha:1.0]];
    [signInButton.layer setCornerRadius:5.0];
    [signInButton setTitle:@"signIn" forState:UIControlStateNormal];
    [signInButton addTarget:self action:@selector(signInButtonClick) forControlEvents:UIControlEventTouchUpInside];
    signInButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    [self.view addSubview:signInButton];
    
    UIButton *signOffButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [signOffButton setFrame:CGRectMake(0, 170, [UMAnalyticsViewController getScreenWidth]/2-5, 40)];
    [signOffButton setBackgroundColor:[UIColor colorWithRed:141/255.0 green:166/255.0 blue:196/255.0 alpha:1.0]];
    [signOffButton.layer setCornerRadius:5.0];
    [signOffButton setTitle:@"signOff" forState:UIControlStateNormal];
    [signOffButton addTarget:self action:@selector(signOffButtonClick) forControlEvents:UIControlEventTouchUpInside];
    signOffButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    [self.view addSubview:signOffButton];
    
    UIButton *dplusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [dplusButton setFrame:CGRectMake(0, [UMAnalyticsViewController getScreenHeight]-150, [UMAnalyticsViewController getScreenWidth], 40)];
    [dplusButton setBackgroundColor:[UIColor colorWithRed:141/255.0 green:166/255.0 blue:196/255.0 alpha:1.0]];
    [dplusButton.layer setCornerRadius:5.0];
    [dplusButton setTitle:@"to Dplus" forState:UIControlStateNormal];
    [dplusButton addTarget:self action:@selector(dplusButtonClick) forControlEvents:UIControlEventTouchUpInside];
    dplusButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    [self.view addSubview:dplusButton];
    
    
}
-(void)eventButtonClick{
    
    [MobClick event:@"umeng_event"];
    
}
-(void)eventAButtonClick{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"popular", @"type", @"JJLin", @"artist"
                          , @"24", @"width", @"43", @"length", @"9.99", @"price"
                          , @199, @"rate", nil];
    [MobClick event:@"ts" attributes:dict];
    
}
-(void)errorButtonClick{
     NSArray *array = [NSArray array];
    [array objectAtIndex:NSUIntegerMax];
    
}
-(void)signInButtonClick{
    [MobClick profileSignInWithPUID:@"umeng@456"];
    
}
-(void)signOffButtonClick{
    [MobClick profileSignOff];

}
-(void)dplusButtonClick{
    UMAnalyticsDplusViewController *dplusView = [[UMAnalyticsDplusViewController alloc] init];
    
    [self presentModalViewController:dplusView animated:YES];
}


+ (float)getScreenHeight
{
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    return screenBounds.size.height;
}

+ (float)getScreenWidth
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    return screenBounds.size.width;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [MobClick beginLogPageView:@"OnePage"];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [MobClick endLogPageView:@"OnePage"];
}
@end