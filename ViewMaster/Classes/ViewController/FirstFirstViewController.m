//
//  FirstFirstViewController.m
//  ViewMaster
//
//  Created by bearbrick on 2014/09/17.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import "FirstFirstViewController.h"
#import "SnoopyViewController.h"
#import "CreateFolderViewController.h"
#import "ForAlertDialog.h"
#import "CommonUtil.h"
#import "Define.h"

@interface FirstFirstViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView_folder;


@end

@implementation FirstFirstViewController
@synthesize items_folder;


BOOL _EditbtnFrag = YES;
BOOL _BackbtnFrag = NO;

NSMutableArray *list;
NSArray *sortList;       //ソート済みarray
NSString *DocumentsDirPath;     //documentへのpath用
NSFileManager *fileManager;
NSSortDescriptor *sortDescriptor;   //ソート用

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"hamana___initWithNibName");
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 
    if (self) {
    }
   
    creatFoleder = [[CreateFolderViewController alloc] init];
    
    items_folder = [NSMutableArray arrayWithCapacity:15];  //Arrayに15の要領を作成する
    
    fileManager = [NSFileManager defaultManager];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //Documentへのpathを取得する　Arrayの0番目に入る
    DocumentsDirPath = [paths objectAtIndex:0];       //0番目をStringに入れる
    
    NSError *error;
    NSArray *array = [fileManager contentsOfDirectoryAtPath:DocumentsDirPath error:&error];    //Pathの配下の一覧を取得する
    
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
    sortList = [array sortedArrayUsingDescriptors:@[sortDescriptor]];
    list = [NSMutableArray arrayWithArray:array];   //MutableArrayにキャストする

    return self;
}

- (void)viewDidLoad
{
    NSLog(@"hamana________viewDidLoad");
    
    [super viewDidLoad];
    
    self.tableView_folder.dataSource = self;        //reloadが呼ばれるように
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(didTapButton)];
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose
                                                                               target:self
                                                                               action:@selector(didTapEdit)];
    
    UIBarButtonItem *deleteButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                                                               target:self
                                                                               action:@selector(didTapDeleteButton)];
    
    UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                  target:nil
                                                                                  action:nil];

    
    UIBarButtonItem *nextViewButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply
                                                                                    target:self
                                                                                    action:@selector(didTapNextButton)];

    UIBarButtonItem *textbutton = [[UIBarButtonItem alloc] initWithTitle:@"test"
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(didTaptextbutton)];
                                   
    
    self.navigationController.toolbar.barTintColor = [UIColor colorWithRed:1.0 green:0.13 blue:0.32 alpha:1.000];       //Toolbarの背景色を変更

    self.toolbarItems = @[addButton,flexibleItem,editButton,flexibleItem,nextViewButton,flexibleItem,deleteButton,flexibleItem,textbutton];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:H_BUTTON_EDIT
                                                                              style:UIBarButtonItemStyleDone
                                                                             target:self
                                                                             action:@selector(EditButtonTap)];
    
//    [_tableView_folder registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellId"];
    _tableView_folder.dataSource = self;
    _tableView_folder.delegate = self;
    
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"hamana____viewWillAppear");
    
    
    _EditbtnFrag = YES;
    [self.navigationController setToolbarHidden:YES animated:YES];      //Toolbar非表示
    [self.navigationItem setHidesBackButton:NO];
    self.navigationItem.rightBarButtonItem.title = H_BUTTON_EDIT;       //編集ボタンの表示
    
    if (_tableView_folder.editing){                         //編集モードがYESの場合NOに変更し編集モードを終了する
        [_tableView_folder setEditing:!_tableView_folder.editing animated:NO];
    }
    [self.tableView_folder deselectRowAtIndexPath:[self.tableView_folder indexPathForSelectedRow] animated:YES];
   
    [self.tableView_folder reloadData];
    
    
}

- (void)didTapEdit {
    ForAlertDialog *alerDialog_h = [[ForAlertDialog alloc] init];
    
    [alerDialog_h showYesNoDialog:@"test" text:@"teste"];
}

-(void)didTapDeleteButton {
    NSLog(@"didTap  delete Button");
    // ファイルマネージャを作成
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //Documentへのpathを取得する　Arrayの0番目に入る
    NSString *DocumentsDirPath = [paths objectAtIndex:0];       //0番目をStringに入れる
    NSLog(@"%@",DocumentsDirPath);
    
    NSError *error;
    NSArray *list = [fileManager contentsOfDirectoryAtPath:DocumentsDirPath     //Pathの配下の一覧を取得する
                                                     error:&error];
    int i= 0;
    // ファイルやディレクトリの一覧を表示する
    for (NSString *path in list) {
    
        NSLog(@"for　一覧ー%d==%@",i ,path);
        i++;
    }
}

- (void)didTaptextbutton {
    
    //入力されたフォルダ名を取り出し代入している
//    NSString *newFolderName = [creatFoleder ReturnText];
//    
//    NSLog(@"text;%@",newFolderName);
//    
//    [items_folder addObject:newFolderName];
  
    int i= 0;
    // ファイルやディレクトリの一覧を表示する
    for (NSString *path in list) {
        
        NSLog(@"for　一覧ー%d==%@",i ,path);
        i++;
    }
}


- (void)EditButtonTap{
    
    NSLog(@"editモード");
    [_tableView_folder setEditing:!_tableView_folder.editing animated:YES];  //Editモードに移行する

    if (_EditbtnFrag) {
        [self.navigationController setToolbarHidden:NO animated:YES];       //Toolbarを表示
        [self.navigationItem setHidesBackButton:YES];                       //Backボタンを非表示
        self.navigationItem.rightBarButtonItem.title = H_BUTTON_DONE;       //完了ボタンを表示
        _EditbtnFrag = NO;
    }else{
        [self.navigationController setToolbarHidden:YES animated:YES];      //Toolbar非表示
        [self.navigationItem setHidesBackButton:NO];                        //Backボタンを表示
        self.navigationItem.rightBarButtonItem.title = H_BUTTON_EDIT;       //編集ボタンを表示
        _EditbtnFrag = YES;
    }
}
    

- (void)didTapNextButton {
    NSLog(@"didTap  next Button");
    snoopy = [[SnoopyViewController alloc]init];
    UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:snoopy];
    [self presentViewController:navCon animated:YES completion:nil];
}




- (void)didTapButton{
    //フォルダ作成画面へ画面遷移
    UINavigationController *navicon = [[UINavigationController alloc] initWithRootViewController:creatFoleder];
    [self presentViewController:navicon animated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



//==========tablecellの設定メソッド================


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return list.count;
    
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {  //セルについて
NSLog(@"cellForRowAtIndexPath");

    [_tableView_folder registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellId"];

    UITableViewCell *cell = [_tableView_folder dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    NSError *error;
    NSArray *array = [fileManager contentsOfDirectoryAtPath:DocumentsDirPath error:&error];    //Pathの配下の一覧を取得する
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
    sortList = [array sortedArrayUsingDescriptors:@[sortDescriptor]];
    
    list = [NSMutableArray arrayWithArray:array];   //MutableArrayにキャストする

    
    NSString *item = [list objectAtIndex:indexPath.row];            //Arrayの中身をStringに代入
NSLog(@"cellfor===%@",item);
    cell.textLabel.text = item;          //それをtextlabelに代入している
    cell.imageView.image = [UIImage imageNamed:ICON_DIRECT];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;    //セルの➡️のスタイルの変更
    
//    cell.detailTextLabel.text = ;
    
    
    
    
    
    
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString *removeObject = [list objectAtIndex:indexPath.row];       //削除対象の名前を取得する
    
//==============ログ確認用=============================================
    NSLog(@"hamama____kitetkawtiajwitioaw");
    NSLog(@"index.row=====%ld",(long)indexPath.row);
    NSLog(@"removeObject===%@",removeObject);
//==============ログ確認用=============================================
    
    
    NSString *filePath = [DocumentsDirPath stringByAppendingPathComponent:removeObject];
    
    NSError *error;
   
    BOOL result = [fileManager removeItemAtPath:filePath error:&error];   //ディレクトリを削除
    
    if (result) {
        NSLog(@"ファイルを削除に成功：%@", filePath);
        if (editingStyle == UITableViewCellEditingStyleDelete) {
            [list removeObjectAtIndex:indexPath.row]; // 削除ボタンが押された行のデータを配列から削除します。
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
        } else if (editingStyle == UITableViewCellEditingStyleInsert) {
            // ここは空のままでOKです。
        }
        
    } else {
        NSLog(@"ファイルの削除に失敗：%@", error.description);
        ForAlertDialog *alert= [[ForAlertDialog alloc] init];
        [alert showYesNoDialog:@"ファイル削除失敗" text:@"もう１度やり直してください"];
    }
}

@end
