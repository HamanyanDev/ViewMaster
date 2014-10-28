//
//  FirstViewController.h
//  ViewMaster
//
//  Created by bearbrick on 2014/09/17.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "ZeroViewController.h"
#import "FirstFirstViewController.h"
#import "EditViewController.h"
#import "ForthViewController.h"
#import "QuickLookViewController.h"
#import "EGORefreshTableHeaderView.h"
#import "EGOlibraryTableViewController.h"
#import "FBTableViewController.h"
#import "ReMenuViewController.h"


@interface FirstViewController : UIViewController <UITableViewDataSource,UITableViewDelegate> {
    __strong NSMutableArray *_items;
    
    IBOutlet __weak UITableView *_tableView;
    
    ZeroViewController *zero;
    FirstFirstViewController *first;
    EditViewController *table;
    ForthViewController *forthView;
    QuickLookViewController *quickView;
    EGOlibraryTableViewController *egolibrary;
    FBTableViewController *fbTableView;
    ReMenuViewController *reMenu;
}@end
