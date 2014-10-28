//
//  OneViewController.h
//  ViewMaster
//
//  Created by HiroyukiHamana on 2014/10/27.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"

@interface OneViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    int FirstFlog;
    WebViewController *webview;
}
@property int FirstFlog;
@end
