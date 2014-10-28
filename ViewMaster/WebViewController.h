//
//  WebViewController.h
//  ViewMaster
//
//  Created by HiroyukiHamana on 2014/10/14.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>
{

int CellNumberFlag;

}

@property int CellNumberFlag;
@property (strong, nonatomic) IBOutlet UIWebView *PicWebView;

@end
