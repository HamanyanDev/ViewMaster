//
//  FileManageHelp.h
//  ViewMaster
//
//  Created by HiroyukiHamana on 2014/10/15.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManageHelp : NSObject
- (NSString*)temporaryDirectory;
/* /tmp/fileName */
- (NSString*)temporaryDirectoryWithFileName:(NSString*)fileName;

/* /Documents */
- (NSString*)documentDirectory;
/* /Documents/fileName */
- (NSString*)documentDirectoryWithFileName:(NSString*)fileName;

/* pathのファイルが存在しているか */
- (BOOL)fileExistsAtPath:(NSString*)path;

/* pathのファイルがelapsedTimeを超えているか */
- (BOOL)isElapsedFileModificationDateWithPath:(NSString*)path elapsedTimeInterval:(NSTimeInterval)elapsedTime;

/* directoryPath内のextension(拡張子)と一致する全てのファイル名 */
- (NSArray*)fileNamesAtDirectoryPath:(NSString*)directoryPath extension:(NSString*)extension;

/* pathのファイルを削除 */
- (BOOL)removeFilePath:(NSString*)path;

@end
