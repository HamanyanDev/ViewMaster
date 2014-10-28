//
//  SectionTableViewController.m
//  ViewMaster
//
//  Created by HiroyukiHamana on 2014/10/27.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import "SectionTableViewController.h"

@interface SectionTableViewController ()

@end

@implementation SectionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    sectionList = [NSArray arrayWithObjects:@"section1",@"section2",@"section3",nil];
    
    NSArray *section1_List = [NSArray arrayWithObjects:@"Money",@"Time",@"Money", nil];
    NSArray *section2_List = [NSArray arrayWithObjects:@"Sydney", @"America",@"France",@"England",nil];
    NSArray *section3_List = [NSArray arrayWithObjects:@"Car", @"Bearbrick",nil];
    
    NSArray *datas = [NSArray arrayWithObjects:section1_List, section2_List, section3_List, nil];
    
    dataSource = [NSDictionary dictionaryWithObjects:datas forKeys:sectionList];  //section名でdatasの中身が取り出せるようになる
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

#pragma mark - Table view data source

//セクションの数を返す
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [sectionList count];
}


//タイトルを取得する
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSLog(@"titleForHeaderInSection");
    return [sectionList objectAtIndex:section];
}

//セクション内のセル数を取得する
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"numberOfRowsInSection");
    NSString *sectionName = [sectionList objectAtIndex:section]; //セクション名を取得する
    return [[dataSource objectForKey:sectionName]count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSString *sectionName = [sectionList objectAtIndex:indexPath.section];
    
    NSArray *items = [dataSource objectForKey:sectionName];
    
    cell.textLabel.text = [items objectAtIndex:indexPath.row];
    return cell;
}


/*
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
