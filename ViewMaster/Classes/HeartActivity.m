//
//  HeartActivity.m
//  ViewMaster
//
//  Created by HiroyukiHamana on 2014/10/29.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import "HeartActivity.h"

@implementation HeartActivity



- (NSString *)activityType {
    NSLog(@"car   activityType!!");
    
    return @"Car";
}


//表示させたい文言(タイトルを返す)
- (NSString *)activityTitle {
    NSLog(@"car　activityTitle!!");
    return @"畠田さん";
}


//表示させたいアイコンの＠より前の文言を返す
- (UIImage *)activityImage {
    NSLog(@"car　activityImage!!");
    
    return [UIImage imageNamed:@"third"];
}



- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems{
    NSLog(@"car　canPerformWithActivityItems!!");
    
    return YES;
}




- (void)prepareWithActivityItems:(NSArray *)activityItems;{
    NSLog(@"prepare!!");
    NSLog(@"car prepareWithActivityItems!!");
    
    [super prepareWithActivityItems:activityItems];
    
}



- (UIViewController *)activityViewController{
    NSLog(@"car　perform!!");
    
    return nil;
}




- (void)performActivity{
    
    NSLog(@"car　perform!!");
    
    // do something with activityItems
    
    [self activityDidFinish:YES];
}





- (void)activityDidFinish:(BOOL)completed{
    NSLog(@"car　finished!!");
    
    [super activityDidFinish:completed];
}

@end
