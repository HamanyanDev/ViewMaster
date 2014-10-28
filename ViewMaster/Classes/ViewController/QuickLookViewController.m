//
//  QuickLookViewController.m
//  ViewMaster
//
//  Created by HiroyukiHamana on 2014/10/15.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import "QuickLookViewController.h"
#import "Define.h"
#import "FirstFirstViewController.h"

static NSString *documents[] =
{   @"bearbrick.jpg",
    @"sample.pdf",
    @"sample.key",
    @"sample.ppt",
};

@interface QuickLookViewController () <QLPreviewControllerDataSource,QLPreviewControllerDelegate,/*DirectoryWatcherDelegate,*/UIDocumentInteractionControllerDelegate>

@property (nonatomic, strong) NSMutableArray *documentURLs;
@property (nonatomic, strong) UIDocumentInteractionController *docInteractionController;   //他のアプリに画像等送るためのクラス

@end

@implementation QuickLookViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


//セクションの数を返すメソッド
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"numberOfSectionsInTableView");
    return 2;
}



//セクション内のcellの数を返すメソッド
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0){
        return H_DOCU_NUM;
    }else{
        return self.documentURLs.count;
    }
}



//セクションのタイトルを設定するメソッド
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *title = nil;
    if (section == 0){
        title = @"First Documents";
    } else {
        if (self.documentURLs.count > 0)
            title = @"Second Folder";
    }
    return title;
}



//cellの高さを返すメソッド
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 58.0f;
}


//cellのレイアウトを設定するメソッド
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    
    NSURL *fileURL;
    if (indexPath.section==0){
        //セクション１
        fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:documents[indexPath.row] ofType:nil]];
    } else {
        //セクション２
        fileURL = [self.documentURLs objectAtIndex:indexPath.row];
    }
    
    NSLog(@"fileurl  %@",fileURL);
 
    [self setupDocumentControllerWithURL:fileURL];      //ドキュメントへフルパスを指定してやるとアイコンが表示できる。
    
    
    
//＝＝＝＝＝＝＝＝＝セルのレイアウトを定義する＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    cell.textLabel.text = [[fileURL path] lastPathComponent];
    
    NSInteger iconCount = [self.docInteractionController.icons count]; //ここではiconCountに０が入っていた
//    NSLog(@"%ld",(long)iconCount);
    
    if (iconCount > 0){
        cell.imageView.image = [self.docInteractionController.icons objectAtIndex:iconCount - 1];
    }
    
    NSString *fileURLString = [self.docInteractionController.URL path];
    NSLog(@"fileURLString----%@",fileURLString);   //null が入っていた
    
    NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:fileURLString error:nil]; //file情報をkey付きの配列で取得する
    NSInteger fileSize = [[fileAttributes objectForKey:NSFileSize] intValue];       //NSfileSizeというＫｅｙでファイルサイズを取得する
    NSString *fileSizeStr = [NSByteCountFormatter stringFromByteCount:fileSize
                                                           countStyle:NSByteCountFormatterCountStyleFile];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", fileSizeStr , self.docInteractionController.UTI];
    return cell;
}



//cellをタップ(選択)された時のメソッド（画面遷移）
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

//QuickLookを呼ぶ（画面遷移）・PreviewController
    QLPreviewController *previewController = [[QLPreviewController alloc] init];
    previewController.dataSource = self;
    previewController.delegate = self;
    
    previewController.currentPreviewItemIndex = indexPath.row;
    [[self navigationController] pushViewController:previewController animated:YES];    //この行でPreviewControllerメソッドに移行する
 
}


- (void)setupDocumentControllerWithURL:(NSURL *)url{        //このメソッドのおかげでアイコンが表示されるようになった。
    
    if (self.docInteractionController == nil){
        NSLog(@"docInteractionController  YES");
        self.docInteractionController = [UIDocumentInteractionController interactionControllerWithURL:url];
        self.docInteractionController.delegate = self;
    } else {
        NSLog(@"docInteractionController  NO");
        self.docInteractionController.URL = url;
    }
}



#pragma mark - UIDocumentInteractionControlerDelegate

//プレビューのコントローラーを作成する
- (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller{
    return self;
}


#pragma mark - QLPreviewControllerDataSource

//表示項目数を返す
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller{
    NSInteger numToPreview = 0;
    
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow]; //選択されている行を取得する
    
    if (selectedIndexPath.section ==0){
        numToPreview = 4;
    } else {
        numToPreview = self.documentURLs.count;
    }
    return numToPreview;
}

//プレビューを解散？させたときに呼ばれるメソッド
- (void)previewControllerDidDismiss:(QLPreviewController *)controller{
    NSLog(@"previewControllerDidDismiss");
}

//プレビューコントローラーがプレビューすべきアイテムを返すメソッド
-(id) previewController:(QLPreviewController *)previewController previewItemAtIndex:(NSInteger)index {
    NSLog(@"previewControllerメソッド");
    NSURL *fileURL = nil;
    
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    
    NSLog(@"selectedIndexPath==%@",selectedIndexPath);
    
    
//    NSBundle *testbundle = [NSBundle mainBundle];
    
    if (selectedIndexPath.section ==0){          //sectionは基本は０　　これは階層が１つしかないということ
        // プロジェクトに管理されているファイル「hoge.png」のパスを取得する
        fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:documents[index] ofType:nil]];  //選択されたindexからfileURLを作成
    } else {
        fileURL = [self.documentURLs objectAtIndex:index];
    }
    NSLog(@"hama__%@",fileURL);
    return fileURL;
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
