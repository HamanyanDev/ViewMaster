//
//  ReMenuViewController.m
//  ViewMaster
//
//  Created by HiroyukiHamana on 2014/10/22.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import "ReMenuViewController.h"
#import "NavigationViewController.h"
#import "HomeViewController.h"


@interface ReMenuViewController ()

@end

@implementation ReMenuViewController

- (void)viewDidLoad {
    NSLog(@"rootView? ReMenuViewController");
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"〓"
                                                                             style:UIBarButtonItemStyleBordered
                                                                            target:self
                                                                            action:@selector(toggleMenu)];
    //Imageview?
    
    //Label?
    
}


- (void)viewWillLayoutSubviews{
    NSLog(@"viewWillLayoutSubView");
    
    [super viewWillLayoutSubviews];
    NavigationViewController *navigationController = (NavigationViewController *)self.navigationController;
    [navigationController.menu setNeedsLayout];
    
}


- (BOOL)shouldAutorotate{
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return YES;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
