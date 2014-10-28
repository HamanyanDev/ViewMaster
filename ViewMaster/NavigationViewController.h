//
//  NavigationViewController.h
//  ViewMaster
//
//  Created by HiroyukiHamana on 2014/10/22.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REMenu.h"

@interface NavigationViewController : UINavigationController

@property (strong, readonly, nonatomic) REMenu *menu;

-(void)toggleMenu;

@end
