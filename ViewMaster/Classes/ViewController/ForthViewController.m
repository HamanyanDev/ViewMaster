//
//  ForthViewController.m
//  ViewMaster
//
//  Created by bearbrick on 2014/10/05.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import "ForthViewController.h"

@interface ForthViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UILabel *storyboad;
@property (weak, nonatomic) IBOutlet UILabel *textlabel;
@property (strong, nonatomic) IBOutlet UIView *ViewController;

@end

@implementation ForthViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ForthView_viewdidLoad");
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
