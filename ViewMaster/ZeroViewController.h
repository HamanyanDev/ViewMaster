//
//  ZeroViewController.h
//  ViewMaster
//
//  Created by bearbrick on 2014/09/17.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"

@interface ZeroViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    int FirstFlog;
    WebViewController *webview;
}
@property int FirstFlog;
@end
