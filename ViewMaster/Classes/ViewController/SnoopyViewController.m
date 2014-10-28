//
//  SnoopyViewController.m
//  ViewMaster
//
//  Created by tvt on 2014/09/18.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import "SnoopyViewController.h"


@interface SnoopyViewController ()

@end

@implementation SnoopyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
//    [self.navigationController setNavigationBarHidden:YES animated:NO];  //Navigationbarを非表示にする
   
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(didTapClose)];
    
    UIBarButtonItem *closebutton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                                                                 target:self
                                                                                 action:@selector(didTapClose)];
    
    self.toolbarItems = @[closebutton];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"hamana____viewWillAppear");
     
    
//    [self.navigationController setToolbarHidden:NO animated:YES];
}



- (void)didTapClose {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
