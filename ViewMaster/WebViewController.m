//
//  WebViewController.m
//  ViewMaster
//
//  Created by HiroyukiHamana on 2014/10/14.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import "WebViewController.h"
#import "Define.h"
#import "FileManageHelp.h"

@interface WebViewController ()

@end

@implementation WebViewController
@synthesize CellNumberFlag;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _PicWebView.scalesPageToFit = YES;          //ピンチインピンチアウトを動作可能に!!
    
//    FileManageHelp *fileManage = [[FileManageHelp alloc] init];
    
//    NSString *DocumentsDirPath = [fileManage documentDirectoryWithFileName:@"sample.png"];
//    NSString *DocumentsDirPathtest = [fileManage documentDirectoryWithFileName:@"sample.txt"];
//
//    NSLog(@"DocumentPath --- %@",DocumentsDirPath);
//    NSLog(@"DocumentPath --- %@",([fileManage fileExistsAtPath:DocumentsDirPath] ? @"YES":@"NO"));
//    NSLog(@"DocumentPath --- %@",([fileManage fileExistsAtPath:DocumentsDirPathtest] ? @"YES":@"NO"));
    

    
//    NSURL *fileURL;
//        // first section is our build-in documents
//        fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.jpeg" ofType:nil]];
//    
//    NSLog(@"fileURL=====%@",fileURL);
    
    
    
    // layout the cell
//    cell.textLabel.text = [[fileURL path] lastPathComponent];   //ファイルパスからファイル名だけ取り出す
//
    
    
    
//    NSString *urlString = nil;             //シミュレータ用＆iTool用
    NSURL *urlString = nil;
    
/*     シミュレーター用＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
        switch (CellNumberFlag) {
            case 0:
                urlString = H_Sample_JPE;
                break;
            case 1:
                urlString = H_Sample_pdf;
                break;
            case 2:
                urlString = H_Sample_xls;
                break;
            case 3:
                urlString = H_Sample_xlsx;
                break;
            case 4:
                urlString = H_Sample_doc;
                break;
            case 5:
                urlString = H_Sample_docx;
                break;
            case 6:
                urlString = H_Sample_PNG;
                break;
            case 7:
                urlString = H_Sample_rtf;
                break;
            case 8:
                urlString = H_Sample_txt;
                break;
            case 9:
                urlString = H_Sample_pdf_Pass;
                break;
            case 10:
                urlString = H_Sample_broken;
                break;
        }
   ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝end=====================　　　*/

    /*     iTool用＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    switch (CellNumberFlag) {
        case 0:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.jpeg"];
            break;
        case 1:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.pdf"];
            break;
        case 2:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.xls"];
            break;
        case 3:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.xlsx"];
            break;
        case 4:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.doc"];
            break;
        case 5:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.docx"];
            break;
        case 6:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.png"];
            break;
        case 7:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.rtf"];
            break;
        case 8:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.txt"];
            break;
        case 9:
            urlString = [fileManage documentDirectoryWithFileName:@"sample_pass.pdf"];
            break;
        case 10:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.broken"];
            break;
        case 11:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.ppt"];
            break;
        case 12:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.pptx"];
            break;
        case 13:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.gif"];
        break;
        case 14:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.jpe"];
        break;
        case 15:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.jpg"];
        break;
        case 16:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.gif"];
            break;
        case 17:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.tiff"];
            break;
        case 18:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.tif"];
            break;
        case 19:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.csv"];
            break;
        case 20:
            urlString = [fileManage documentDirectoryWithFileName:@"samplea.numbers"];
            break;
        case 21:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.pages"];
            break;
        case 22:
            urlString = [fileManage documentDirectoryWithFileName:@"samplea.numbers.zip"];
            break;
        case 23:
            urlString = [fileManage documentDirectoryWithFileName:@"sample.pages.zip"];
            break;
    }

     ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝end=====================　　　*/
    
    
    
    
//===============--  最終候補用  =====================================
    
    switch (CellNumberFlag) {
        case 0:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.jpeg" ofType:nil]];
            break;
        case 1:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.pdf" ofType:nil]];
            break;
        case 2:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample_3s.xls" ofType:nil]];
            break;
        case 3:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.xlsx" ofType:nil]];
            break;
        case 4:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample_3s.doc" ofType:nil]];
            break;
        case 5:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.docx" ofType:nil]];
            break;
        case 6:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sampleA.png" ofType:nil]];
            break;
        case 7:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.rtf" ofType:nil]];
            break;
        case 8:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.txt" ofType:nil]];
            break;
        case 9:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample_pass.pdf" ofType:nil]];
            break;
        case 10:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.broken" ofType:nil]];
            break;
        case 11:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.ppt" ofType:nil]];
            break;
        case 12:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.pptx" ofType:nil]];
            break;
        case 13:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.gif" ofType:nil]];
            break;
        case 14:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.jpe" ofType:nil]];
            break;
        case 15:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.jpg" ofType:nil]];
            break;
        case 16:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.gif" ofType:nil]];
            break;
        case 17:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.tiff" ofType:nil]];
            break;
        case 18:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.tif" ofType:nil]];
            break;
        case 19:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.csv" ofType:nil]];
            break;
        case 20:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"samplea.numbers" ofType:nil]];
            break;
        case 21:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.pages" ofType:nil]];
            break;
        case 22:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"samplea.numbers.zip" ofType:nil]];
            break;
        case 23:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.pages.zip" ofType:nil]];
            break;
        case 24:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.key" ofType:nil]];
            break;
        case 25:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.key.zip" ofType:nil]];
            break;
        case 26:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.rtf" ofType:nil]];
            break;
        case 27:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.rtfd.zip" ofType:nil]];
            break;
        case 28:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.rtfd" ofType:nil]];
            break;
            
    }
    
    
    
    

        /*WebViewを生成する〜〜〜*/
//    NSURL *pictureURL = [NSURL URLWithString:urlString];　　                   　//シミュレータ用＆iTool用
//    NSURLRequest *myrequest = [NSURLRequest requestWithURL:pictureURL];       　//シミュレータ用＆iTool用
    
    
    NSURLRequest *myrequest = [NSURLRequest requestWithURL:urlString];
    [self.PicWebView loadRequest:myrequest];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"□"
                                                                              style:UIBarButtonItemStyleDone
                                                                             target:self
                                                                             action:@selector(EditButtonTap)];
    
    
    //------------------- ToolBar--------------------------//
    
    UIBarButtonItem *deleteButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                                                                  target:self
                                                                                  action:@selector(EditButtonTap)];
    
    UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                  target:nil
                                                                                  action:nil];
    
    UIBarButtonItem *nextViewButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply
                                                                                    target:self
                                                                                    action:@selector(ReplyButtonTap)];
    
    
    
    self.toolbarItems = @[deleteButton,flexibleItem,nextViewButton,flexibleItem,deleteButton,flexibleItem,nextViewButton,flexibleItem];
    
    
    self.navigationController.toolbar.barTintColor = [UIColor colorWithRed:1.0 green:0.09 blue:0.27 alpha:1.000];       //Toolbarの背景色を変更
    [self.navigationController setToolbarHidden:NO animated:YES];      //Toolbar表示
    
}

- (void) EditButtonTap {
    
//    _PicWebView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    self.navigationController.navigationBar.hidden = YES;
    [self prefersStatusBarHidden];
    [self.navigationController setToolbarHidden:YES animated:YES];      //Toolbar表示
    
    
    _PicWebView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

    
    //[self.view bringSubviewToFront:self.propertyView];
}


- (void)ReplyButtonTap{
    NSLog(@"ReplyButtonTap");
    
    
    NSURL *picURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.txt" ofType:nil]];
    
    NSString *filestring = [picURL path];
    
    NSLog(@"NSURL====%@",picURL);
    NSLog(@"NSString====%@",filestring);
    
    
    NSData *imageData = [NSData dataWithContentsOfFile:filestring];
    
    
    [self displayActivityControllerWithDataObject:imageData];
}




- (void)displayActivityControllerWithDataObject:(id)obj {
    UIActivityViewController* vc = [[UIActivityViewController alloc]
                                    initWithActivityItems:@[obj]
                                    applicationActivities:nil];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{  //インジケーターを非表示
    NSLog(@"webViewDidFinishLoad");
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    _PicWebView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);  //

}

- (void)webViewDidStartLoad:(UIWebView *)webView{   //インジケーターを表示
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    _PicWebView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);  //

}

- (void)viewWillAppear:(BOOL)animated{
    _PicWebView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);  //

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

*/

@end
