//
//  NavigationViewController.m
//  ViewMaster
//
//  Created by HiroyukiHamana on 2014/10/22.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import "NavigationViewController.h"
#import "HomeViewController.h"
#import "ActivityView.h"
#import "DeleteView.h"

@interface NavigationViewController ()

@property (strong,readwrite,nonatomic) REMenu *menu;



@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(REUIKitIsFlatMode()) {
        [self.navigationBar performSelector:@selector(setBarTintColor:) withObject:[UIColor colorWithRed:0/2555.0 green:213/255.0 blue:161/255.0 alpha:1]];
        self.navigationBar.tintColor = [UIColor whiteColor];
        
    } else {
        self.navigationBar.tintColor = [UIColor colorWithRed:0 green:179/255.0 blue:134/255.0 alpha:1];
    }
    
    __typeof(self) __weak weakSelf = self;
    REMenuItem *homeItem = [[REMenuItem alloc] initWithTitle:@"Home"
                                                    subtitle:@"Return to HomeScreen"
                                                       image:[UIImage imageNamed:@"Icon_Home"]
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item){
                                                          NSLog(@"Home ");
                                                          HomeViewController *controller = [[HomeViewController alloc] init];
                                                          [weakSelf setViewControllers:@[controller] animated:NO];
                                                      }];
    REMenuItem *delete = [[REMenuItem alloc] initWithTitle:@"Delete"
                                                    subtitle:@"Delete this file"
                                                       image:[UIImage imageNamed:@"Icon_Home"]
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item){
                                                          NSLog(@"delete");
                                                          DeleteView *dele = [[DeleteView alloc] init];
                                                          [weakSelf setViewControllers:@[dele] animated:NO];
                                                      }];
    REMenuItem *activity = [[REMenuItem alloc] initWithTitle:@"Activity"
                                                    subtitle:@"Activity something"
                                                       image:[UIImage imageNamed:@"Icon_Home"]
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item){
                                                          NSLog(@"Activity ");
                                                          ActivityView *actView = [[ActivityView alloc] init];
                                                          [weakSelf setViewControllers:@[actView] animated:NO];
                                                      }];
    activity.badge = @"15";         //バッジを付ける
    
    homeItem.tag = 0;
    delete.tag = 1;
    activity.tag = 2;
    
    self.menu = [[REMenu alloc] initWithItems:@[homeItem, delete, activity]];
    
    if (!REUIKitIsFlatMode()){
        self.menu.cornerRadius = 4;  //角の設定
        self.menu.shadowRadius = 4;  //の設定
        self.menu.shadowColor = [UIColor blackColor];  //設定
        self.menu.shadowOffset = CGSizeMake(0, 1);  //設定
        self.menu.shadowOpacity = 1;  //
    }
    
    
    self.menu.separatorOffset = CGSizeMake(15.0,0.0);
    self.menu.imageOffset = CGSizeMake(5,-1);
    self.menu.waitUntilAnimationIsComplete = NO;
    self.menu.badgeLabelConfigurationBlock = ^(UILabel *badgeLabl, REMenuItem *item) {
        badgeLabl.backgroundColor= [UIColor colorWithRed:0 green:179/255.0 blue:134/255.0 alpha:1];
        badgeLabl.layer.borderColor = [UIColor colorWithRed:0.000 green:0.648 blue:0.507 alpha:1.000].CGColor;
    };
    self.menu.delegate = self;
    
    [self.menu setClosePreparationBlock:^{
        NSLog(@"setClosePreparationBlock   Menu Will Close");
    }];
    
    [self.menu setCloseCompletionHandler:^{
        NSLog(@"setCloseCompletionHandler   Menu did Close");
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toggleMenu{
    if (self.menu.isOpen){
        return [self.menu close];
    }
    [self.menu showFromNavigationController:self];
}


- (void)willOpenMenu:(REMenu *)menu {
    NSLog(@"");
}

- (void)didOpenMenu:(REMenu *)menu {
    NSLog(@"");
}
- (void)willCloseMenu:(REMenu *)menu {
    NSLog(@"");
}
- (void)didCloseMenu:(REMenu *)menu {
    NSLog(@"");
}






@end
