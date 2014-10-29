//
//  FirstViewController.m
//  ViewMaster
//
//  Created by bearbrick on 2014/09/17.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import "FirstViewController.h"
#import "ZeroViewController.h"
#import "FirstFirstViewController.h"
#import "Define.h"
#import "EditViewController.h"
#import "ForthViewController.h"
#import "QuickLookViewController.h"
#import "EGOlibraryTableViewController.h"
#import "FBTableViewController.h"
#import "ReMenuViewController.h"
#import "ViewMasterAppDelegate.h"
#import "HomeViewController.h"
#import "SectionTableViewController.h"
#import "OneViewController.h"
#import "AirDropTableView.h"

//#import "TableEditTableViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)init {
    
    self = [super initWithNibName:nil bundle:nil];
        if (self) {
        self.title = H_TITLE_FIRST;

        _items = [NSMutableArray arrayWithCapacity:25];
        
        [_items addObject:@"WebViewController_A"];
        [_items addObject:@"WebViewController_B"];
        [_items addObject:@"FirstFirstViewController"];
        [_items addObject:@"EditViewController"];
        [_items addObject:@"ForthViewController"];
        [_items addObject:@"QuickLookViewController"];
        [_items addObject:@"EGOlibraryTableViewController"];
        [_items addObject:@"FBTableViewController"];
        [_items addObject:@"REMenuViewController"];
        [_items addObject:@"SectionTableViewController"];
        [_items addObject:@"AirDropMenuViewController"];
            
        [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:1.0 green:0.09 blue:0.27 alpha:1.000];
        
        
            //#FF0066
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellId"];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    //次画面にBackボタンを設定する
    UIBarButtonItem *backbtn = [[UIBarButtonItem alloc]init];
    backbtn.title = H_BUTTON_BACK;
    self.navigationItem.backBarButtonItem = backbtn;
    
    NSString *pstrErrMessage = [NSString stringWithFormat:MSG_REQUIRED_ERR, SUBMSG_FOLDERNAME_ERR];
    NSLog(@"%@",pstrErrMessage);
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    self.navigationController.navigationBar.hidden = NO;
    
    [self.navigationController setToolbarHidden:YES animated:NO];       //Bottombarを非表示
    
}


#pragma mark - UITableViewDataSource


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSLog(@"FirstViewControler  セルの数を返すnumberOfRowsInSection");
    return _items.count;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *title = nil;
    
    if(section == 0){
        title = @"section1";
    } else {
        title = @"section2";
    }
    return title;
}



- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {  //セルについて
//    NSLog(@"FirstViewControler  cellForRowAtIndexPath");
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    NSString *item = [_items objectAtIndex:indexPath.row];   //Arrayの中身をStringに代入
    cell.textLabel.text = item;      //それをtextlabelに代入している
    cell.imageView.image = [UIImage imageNamed:ICON_HEART];
    
    
//  cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;//UITableViewCellAccessoryDetailDisclosureButton;       //➡️に着いてる矢印みたいなやつの表示スタイル
    
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;    //セルの➡️のスタイルの変更
    
    return cell;
}

#pragma mark - UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0){
        zero = [[ZeroViewController alloc] init];
        zero.FirstFlog = 0;
        [self.navigationController pushViewController:zero animated:YES];
    } else if (indexPath.row == 1){
        OneViewController *oneView= [[OneViewController alloc] init];
        [self.navigationController pushViewController:oneView animated:YES];
    } else if (indexPath.row == 2){
        first = [[FirstFirstViewController alloc] init];
        [self.navigationController pushViewController:first animated:YES];
    } else if (indexPath.row == 3){
        table = [[EditViewController alloc] init];
        [self.navigationController pushViewController:table animated:YES];
    } else if (indexPath.row == 4){
        forthView = [[ForthViewController alloc] init];
        [self.navigationController pushViewController:forthView animated:YES];
    } else if (indexPath.row == 5){
        quickView = [[QuickLookViewController alloc] init];
        [self.navigationController pushViewController:quickView animated:YES];
    } else if (indexPath.row == 6){
        egolibrary = [[EGOlibraryTableViewController alloc] init];
        [self.navigationController pushViewController:egolibrary animated:YES];
    } else if (indexPath.row == 7){
        fbTableView = [[FBTableViewController alloc] init];
        [self.navigationController pushViewController:fbTableView animated:YES];
    } else if (indexPath.row == 8){
       // reMenu = [[ReMenuViewController alloc] init];
       // HomeViewController *home = [[HomeViewController alloc] init];
        
       // [self.navigationController pushViewController:home animated:YES];
    } else if (indexPath.row == 9){
        SectionTableViewController *section = [[SectionTableViewController alloc] init];
        [self.navigationController pushViewController:section animated:YES];
    } else if (indexPath.row == 10){
        AirDropTableView *airdrop = [[AirDropTableView alloc] init];
        [self.navigationController pushViewController:airdrop animated:YES];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//このメソッドを追加することで横にフリックすることで削除ボタンが現れる
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // インデックス保持
//        // int index = [indexPath indexAtPosition:[indexPath length] - 1];
//        // 削除ボタンを押下されたボタンの行を削除
//        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 //   }
}






@end
