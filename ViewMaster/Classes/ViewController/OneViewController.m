//
//  OneViewController.m
//  ViewMaster
//
//  Created by HiroyukiHamana on 2014/10/27.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//
#import "OneViewController.h"
#import "WebViewController.h"
#import "FileManageHelp.h"
#import "Define.h"


@interface OneViewController ()
@property (weak, nonatomic) IBOutlet UITableView *PicChoiceTableView;
@property NSMutableArray *items;
@property (nonatomic,strong) UIDocumentInteractionController *docInteractionController;

@end

@implementation OneViewController
@synthesize FirstFlog;
@synthesize items;

//NSMutableArray *items;

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
    // Do any additional setup after loading the view from its nib.
    
    items = [NSMutableArray arrayWithCapacity:30];
    
    _PicChoiceTableView.dataSource = self;
    _PicChoiceTableView.delegate = self;
    
    [items addObject:@"sample.jpeg"];
    [items addObject:@"sample.pdf"];
    [items addObject:@"sample_3s.xls"];
    [items addObject:@"sample.xlsx"];
    [items addObject:@"sample_3s.doc"];
    [items addObject:@"sample.docx"];
    [items addObject:@"sample.rtf"];
    [items addObject:@"sample.txt"];
    [items addObject:@"sample_pass.pdf"];
    [items addObject:@"sample.broken"];
    [items addObject:@"sample.ppt"];
    [items addObject:@"sample.pptx"];
    [items addObject:@"sample.gif"];
    [items addObject:@"sample.jpe"];
    [items addObject:@"sample.jpg"];
    [items addObject:@"sample.gif"];
    [items addObject:@"sample.tiff"];
    [items addObject:@"sample.tif"];
    [items addObject:@"sample.csv"];
    [items addObject:@"samplea.numbers"];
    [items addObject:@"sample.pages"];
    [items addObject:@"samplea.numbers.zip"];
    [items addObject:@"sample.pages.zip"];
    [items addObject:@"sample.key"];
    [items addObject:@"sample.key.zip"];
    [items addObject:@"sample.rtf"];
    [items addObject:@"sample.rtfd.zip"];
    [items addObject:@"sample.rtfd"];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:H_BUTTON_EDIT
                                                                              style:UIBarButtonItemStyleDone
                                                                             target:self
                                                                             action:@selector(EditButtonTap)];
}

- (void)EditButtonTap{
    NSLog(@"EditButton");
    [self.PicChoiceTableView setEditing:!_PicChoiceTableView.editing animated:YES];  //Editモードに移行する
}



-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController setToolbarHidden:YES animated:NO];       //Bottombarを非表示
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //    NSLog(@"zeroViewControler  セルの数を返すnumberOfRowsInSection");
    return items.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {  //セルについて
    NSLog(@"zeroViewControler  cellForRowAtIndexPath");
    
    //    UITableViewCell *cell = [_PicChoiceTableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    UITableViewCell *cell = [_PicChoiceTableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:
                @"Cell"];
    }
    
    
    NSString *itemName = [items objectAtIndex:indexPath.row];
    cell.textLabel.text = itemName;    //Arrayの中身をtextlabelに代入している
//    cell.imageView.image = [UIImage imageNamed:itemName];
   
    
    
    
    NSURL *fileurl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:itemName ofType:nil]];
    
    
    
    
    
    
    [self setupDocumentControllerWithURL:fileurl];      //アイコン出現用に追記!!!!
    
    NSInteger iconCount = [self.docInteractionController.icons count]; //ここではiconCountに０が入っていた
    //    NSLog(@"%ld",(long)iconCount);
    
    if (iconCount > 0){
        cell.imageView.image = [self.docInteractionController.icons objectAtIndex:iconCount - 1];   //アイコンを設定する
    }
    
    
    
    
    
    
    NSString *fileURLString = [self.docInteractionController.URL path];
    NSLog(@"fileURLString----%@",fileURLString);   //null が入っていた
    
    NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:fileURLString error:nil]; //file情報をkey付きの配列で取得する
    NSInteger fileSize = [[fileAttributes objectForKey:NSFileSize] intValue];       //NSfileSizeというＫｅｙでファイルサイズを取得する
    NSString *fileSizeStr = [NSByteCountFormatter stringFromByteCount:fileSize
                                                           countStyle:NSByteCountFormatterCountStyleFile];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", fileSizeStr , self.docInteractionController.UTI];
//    return cell;

    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    NSDictionary *fileAttribute = [[NSFileManager defaultManager] attributesOfItemAtPath:fileString error:nil];
//    NSInteger fileSize = [[fileAttribute objectForKey:NSFileSize] intValue];
//    NSString *fileSizeStr = [NSByteCountFormatter stringFromByteCount:fileSize
//                                                           countStyle:NSByteCountFormatterCountStyleFile];
    
//    NSFileManager *fm = [NSFileManager defaultManager];
//    NSDictionary *attribute = [fm attributesOfItemAtPath:fileString error:nil];
//    NSDate *creationDate = [attribute objectForKey:NSFileCreationDate];
//    NSDate *modificationDate = [attribute objectForKey:NSFileModificationDate];
    
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"size:%@, update:%@",fileSizeStr,modificationDate];
    
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;    //セルの>のスタイルの変更
    return cell;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    webview = [[WebViewController alloc] init];
    
    switch (indexPath.row) {
        case 0:
            webview.CellNumberFlag = 0;
            break;
        case 1:
            webview.CellNumberFlag = 1;
            break;
        case 2:
            webview.CellNumberFlag = 2;
            break;
        case 3:
            webview.CellNumberFlag = 3;
            break;
        case 4:
            webview.CellNumberFlag = 4;
            break;
        case 5:
            webview.CellNumberFlag = 5;
            break;
        case 6:
            webview.CellNumberFlag = 6;
            break;
        case 7:
            webview.CellNumberFlag = 7;
            break;
        case 8:
            webview.CellNumberFlag = 8;
            break;
        case 9:
            webview.CellNumberFlag = 9;
            break;
        case 10:
            webview.CellNumberFlag = 10;
            break;
        case 11:
            webview.CellNumberFlag = 11;
            break;
        case 12:
            webview.CellNumberFlag = 12;
            break;
        case 13:
            webview.CellNumberFlag = 13;
            break;
        case 14:
            webview.CellNumberFlag = 14;
            break;
        case 15:
            webview.CellNumberFlag = 15;
            break;
        case 16:
            webview.CellNumberFlag = 16;
            break;
        case 17:
            webview.CellNumberFlag = 17;
            break;
        case 18:
            webview.CellNumberFlag = 18;
            break;
        case 19:
            webview.CellNumberFlag = 19;
            break;
        case 20:
            webview.CellNumberFlag = 20;
            break;
        case 21:
            webview.CellNumberFlag = 21;
            break;
        case 22:
            webview.CellNumberFlag = 22;
            break;
        case 23:
            webview.CellNumberFlag = 23;
            break;
        case 24:
            webview.CellNumberFlag = 24;
            break;
        case 25:
            webview.CellNumberFlag = 25;
            break;
        case 26:
            webview.CellNumberFlag = 26;
            break;
        case 27:
            webview.CellNumberFlag = 27;
            break;
        case 28:
            webview.CellNumberFlag = 28;
            break;
    }
    
    [self.navigationController pushViewController:webview animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return H_CELL_HIGH;
}

// テーブルビューの編集モード
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // インデックス保持
//        // int index = [indexPath indexAtPosition:[indexPath length] - 1];
//
//        // ここで配列などデータの削除を行う
//
//
//
//        // 削除ボタンを押下されたボタンの行を削除
//        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }
//}

// 削除ボタンの文言変更
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"Arrange";
}






//============================以下をアイコンを出すために追記する===========================================




- (void)setupDocumentControllerWithURL:(NSURL *)url{        //このメソッドのおかげでアイコンが表示されるようになった。
    
    if (self.docInteractionController == nil){
        NSLog(@"docInteractionController  YES");
        self.docInteractionController = [UIDocumentInteractionController interactionControllerWithURL:url];
        self.docInteractionController.delegate = self;
    } else {
        NSLog(@"docInteractionController  NO");
        NSLog(@"fileurl===%@",url);
        self.docInteractionController.URL = url;
    }
}
































@end
