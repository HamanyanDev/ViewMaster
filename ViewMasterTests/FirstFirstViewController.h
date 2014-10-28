//
//  FirstFirstViewController.h
//  ViewMaster
//
//  Created by bearbrick on 2014/09/17.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateFolderViewController.h"
#import "SnoopyViewController.h"

@interface FirstFirstViewController : UIViewController<UITableViewDataSource,UITableViewDelegate> {
 
@public
__strong NSMutableArray *items_folder;
    SnoopyViewController *snoopy;
    CreateFolderViewController *creatFoleder;
}

@property NSMutableArray *items_folder;
@end
