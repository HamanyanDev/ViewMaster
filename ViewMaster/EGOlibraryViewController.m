//
//  EGOlibraryViewController.m
//  ViewMaster
//
//  Created by HiroyukiHamana on 2014/10/21.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import "EGOlibraryViewController.h"

@interface EGOlibraryViewController ()

@end

@implementation EGOlibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cell_string = @"Before";
    
    
    
    if (_refreshHeaderview ==nil) {
        //更新サイズとデリゲートを指定する
        EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:
                                           CGRectMake(  0.0f,
                                                        0.0f - self.tableView.bounds.size.height,
                                                        self.view.frame.size.width ,
                                                        self.tableView.bounds.size.height)];
        
        view.delegate = self;
        [self.tableView addSubview:view];
        _refreshHeaderview = view;
    }
    
    [_refreshHeaderview refreshLastUpdatedDate];    //最終更新履歴を記録する

}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // 表示されるセルのテキストを設定
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %ld", _cell_string, (long)indexPath.row];
    // Update後だったら文字色を変更
    if ([_cell_string isEqualToString:@"Update"]) {
        cell.textLabel.textColor = [UIColor brownColor];
    }
    return cell;
}



//スクロールされたことをライブラリに伝える
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [_refreshHeaderview egoRefreshScrollViewDidScroll:scrollView];
}


//スクロールが終了されたことをライブラリに伝える
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"scrollViewDidEndDragging");
    
    [_refreshHeaderview egoRefreshScrollViewDidEndDragging:scrollView];
}



//テーブルを下に引くとここが呼ばれる
//リロードして３秒後にdoneLoadingTableviewDataを呼び出す
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view {
    NSLog(@"egoRefreshTableHeaderDidTriggerRefresh");
    
    
    _reloading = YES;
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperationWithBlock:^{
        
        //更新処理など重い処理をここに記述するー３秒間で実施する？
        [NSThread sleepForTimeInterval:3];
        _cell_string = @"Update dane!!";
        [self.tableView reloadData];
        
        
        //メインスレッドで更新完了処理を呼ぶ
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self doneLoadingTableViewData];
        }];
    }];
}



//更新完了処理
- (void)doneLoadingTableViewData{
    NSLog(@"doneLoadingTableViewData--更新完了");
    
  //更新完了をライブラリ側に通知する
    _reloading = NO;
    [_refreshHeaderview egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
}




// 更新状態を返す
- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
    return _reloading;
}


// 最終更新日を更新する際の日付の設定
- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
    return [NSDate date];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
