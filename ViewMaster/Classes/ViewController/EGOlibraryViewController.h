//
//  EGOlibraryViewController.h
//  ViewMaster
//
//  Created by HiroyukiHamana on 2014/10/21.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"


@interface EGOlibraryViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate,EGORefreshTableHeaderDelegate>
{
    //更新中を表示するView
    EGORefreshTableHeaderView *_refreshHeaderview;
    BOOL _reloading;
    
    NSString *_cell_string; //更新時に変更するStirng

}
@end
