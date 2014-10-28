//
//  CommonUtil.h
//  ViewMaster
//
//  Created by tvt on 2014/10/06.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonUtil : NSObject

+ (NSString*)documentDir;

+ (BOOL) makeDir:(NSString*)dirName saveDir:(NSString *)saveDir;



@end
