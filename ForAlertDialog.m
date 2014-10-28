//
//  ForAlertDialog.m
//  ViewMaster
//
//  Created by tvt on 2014/10/06.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import "ForAlertDialog.h"

@implementation ForAlertDialog


//YEsNOダイアログの表示
- (void) showYesNoDialog:(NSString*)title text:(NSString*)text {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:text
                                                   delegate:self
                                          cancelButtonTitle:@"YES"
                                          otherButtonTitles:@"NO", nil];
    [alert show];
    
}


@end
