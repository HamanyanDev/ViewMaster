//
//  AlertDialog.m
//  ViewMaster
//
//  Created by bearbrick on 2014/10/05.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import "AlertDialogg.h"

@implementation AlertDialogg

- (void) showAlert{

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title"
                                                 message:@"Message"
                                                delegate:self
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
    [alert show];

}



//YEsNOダイアログの表示
- (void) showYesNoDialog:(NSString*)title text: (NSString*)text {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:text
                                                   delegate:self
                                          cancelButtonTitle:@"YES"
                                          otherButtonTitles:@"NO", nil];
    [alert show];
    
}


- ( int) Returnmethod {
    return 3;
}



@end
