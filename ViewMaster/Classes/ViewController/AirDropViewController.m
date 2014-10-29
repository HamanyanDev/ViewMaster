//
//  AirDropViewController.m
//  ViewMaster
//
//  Created by HiroyukiHamana on 2014/10/28.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import "AirDropViewController.h"
#import "HeartActivity.h"


@interface AirDropViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *AirDropWebView;

@end

@implementation AirDropViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _AirDropWebView.scalesPageToFit = YES;          //ピンチインピンチアウトを動作可能に!!
  
    NSURL *urlString = nil;
    

    
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
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.rtf" ofType:nil]];
            break;
        case 7:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.txt" ofType:nil]];
            break;
        case 8:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample_pass.pdf" ofType:nil]];
            break;
        case 9:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.broken" ofType:nil]];
            break;
        case 10:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.ppt" ofType:nil]];
            break;
        case 11:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.pptx" ofType:nil]];
            break;
        case 12:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.gif" ofType:nil]];
            break;
        case 13:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.jpe" ofType:nil]];
            break;
        case 14:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.jpg" ofType:nil]];
            break;
        case 15:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.gif" ofType:nil]];
            break;
        case 16:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.tiff" ofType:nil]];
            break;
        case 17:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.tif" ofType:nil]];
            break;
        case 18:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.csv" ofType:nil]];
            break;
        case 19:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"samplea.numbers" ofType:nil]];
            break;
        case 20:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.pages" ofType:nil]];
            break;
        case 21:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"samplea.numbers.zip" ofType:nil]];
            break;
        case 22:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.pages.zip" ofType:nil]];
            break;
        case 23:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.key" ofType:nil]];
            break;
        case 24:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.key.zip" ofType:nil]];
            break;
        case 25:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.rtf" ofType:nil]];
            break;
        case 26:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.rtfd.zip" ofType:nil]];
            break;
        case 27:
            urlString = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample.rtfd" ofType:nil]];
            break;
            
    }
    
    
    
    
    NSURLRequest *myrequest = [NSURLRequest requestWithURL:urlString];
    [self.AirDropWebView loadRequest:myrequest];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"〓"
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
    
    UIBarButtonItem *airdropButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                                                  target:self
                                                                                  action:@selector(AirdropButtonTap)];
    
    UIBarButtonItem *tempButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                  target:self
                                                                                  action:@selector(EditButtonTap)];
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                                                                                  target:self
                                                                                  action:@selector(EditButtonTap)];
    
    
    
    self.toolbarItems = @[ deleteButton,flexibleItem,nextViewButton,flexibleItem,tempButton,flexibleItem,searchButton,flexibleItem,airdropButton];
    
    
    self.navigationController.toolbar.barTintColor = [UIColor colorWithRed:1.0 green:0.09 blue:0.27 alpha:1.000];       //Toolbarの背景色を変更
    [self.navigationController setToolbarHidden:NO animated:YES];      //Toolbar表示
    
}




- (void)AirdropButtonTap{
    NSString *text = @"Hello World!";
    UIImage* image1 = [UIImage imageNamed:@"book.jpg"];
    UIImage* image2 = [UIImage imageNamed:@"tree.png"];
    NSArray* actItems = [NSArray arrayWithObjects:text, image1, image2 , nil];
    
    
    
    HeartActivity* airdrop_1 = [[HeartActivity alloc] init];
//    SnowActivity* a2 = [[[SnowActivity alloc] init] autorelease];
    NSArray* myItems = [NSArray arrayWithObjects:airdrop_1, nil];
    
    UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:actItems applicationActivities:myItems];
    
    [self presentViewController:activityView animated:YES completion:^{
    }];

    
    
}



- (void) EditButtonTap {
    
    //    _PicWebView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    self.navigationController.navigationBar.hidden = YES;
    [self prefersStatusBarHidden];
    [self.navigationController setToolbarHidden:YES animated:YES];      //Toolbar表示
    
    
    _AirDropWebView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    
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
    _AirDropWebView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);  //
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView{   //インジケーターを表示
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    _AirDropWebView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);  //
    
}

- (void)viewWillAppear:(BOOL)animated{
    _AirDropWebView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);  //
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
