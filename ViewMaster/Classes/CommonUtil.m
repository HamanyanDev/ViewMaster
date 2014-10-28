//
//  CommonUtil.m
//  ViewMaster
//
//  Created by tvt on 2014/10/06.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import "CommonUtil.h"

@implementation CommonUtil

//Documentフォルダのディレクトリを取得する
+ (NSString*)documentDir
{
    //ホームディレクトリ・DOcumentsの取得
    NSArray *docFolders = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *homeDir = [docFolders lastObject];
    
    //保存ファイルのディレクトリ
//    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *docDir =[NSString stringWithFormat:@"%@/ScanFile",homeDir];
    
    return docDir;
}

//ディレクトリの作成
+ (BOOL) makeDir:(NSString*)dirName saveDir:(NSString *)saveDir
{
    NSString *path = [saveDir stringByAppendingString:@"/"];  //saveDirと　"/" を結合する▶︎pathへ！！
    path = [path stringByAppendingPathComponent:dirName];
    if (![[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:NULL])
    {
        NSLog(@"makeDir    can't make directory %@",path);
        return NO;
    }
    return YES;
}

@end
