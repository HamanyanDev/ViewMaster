//
//  EditViewController.m
//  ViewMaster
//
//  Created by tvt on 2014/10/03.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import "EditViewController.h"
#import "Define.h"

@interface EditViewController ()

@property (strong, nonatomic) NSMutableArray *row;

@end

@implementation EditViewController




- (void)viewDidLoad {
    NSLog(@"haa____viewDidLoad__EditViewController");
    
    
    [super viewDidLoad];
    
    self.title = @"Editting";
    self.row = [NSMutableArray arrayWithCapacity:100];
    for (int i = 0; i<100; i++){
        NSString *cellTitle = [NSString stringWithFormat:@"仮フォルダ%d",i];
        [_row addObject:cellTitle];
    }
    
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:H_BUTTON_EDIT
                                                                              style:UIBarButtonItemStyleBordered
                                                                             target:self
                                                                             action:@selector(didTapEditButton)];
}

- (void)didTapEditButton {
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    
    NSLog(@"editモード");
}



//削除ボタンの文言を変更する
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"Arrange";
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _row.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"EditView cellForRowAtIndexPath");
    NSString *reuseldentifier = @"CellID";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:reuseldentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseldentifier];
    }
    
    NSString *title = [_row objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    cell.imageView.image = [UIImage imageNamed:ICON_DIRECT];
    
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"commitEditingStyle");
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_row removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"canMoveRowAtIndexPath");
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSLog(@"moveRowAtIndexPath");
    if (destinationIndexPath.row < _row.count) {
        NSString *title = [_row objectAtIndex:sourceIndexPath.row];
        [_row removeObjectAtIndex:sourceIndexPath.row];
        [_row insertObject:title atIndex:destinationIndexPath.row];
    }
}
















@end
