//
//  SixStepTableViewController.m
//  taiwan8
//
//  Created by ALEX on 2014/12/17.
//  Copyright (c) 2014年 taiwan8. All rights reserved.
//

#import "SixStepTableViewController.h"
#import "CasePreviewTitleViewController.h"
#import "CasePreviewTitleViewController2.h"
#import "CasePreviewTitleViewController3.h"
#import "CasePreviewTitleViewController4.h"
//#import "CasePreviewDescViewController.h"
//#import "PartTimeTableViewController.h"
//#import "TimeAndMessengerTableViewController.h"
//#import "SetAddressTableViewController.h"
//#import "PartTimeCheckMoneyViewController.h"
//#import "checkMoneyViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import "UIImage+ResizeAdditions.h"
#import "SixStepTableViewController.h"
//#import "SetOptionViewController.h"
//#import "agreePageViewController.h"
//#import "ToViewController.h"

@interface SixStepTableViewController (){
    NSTimer *blinkTimer;
}
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation SixStepTableViewController
@synthesize detailItem = _detailItem;
@synthesize countDownNumber = _countDownNumber;
@synthesize titleLabel = _titleLabel;
@synthesize hasPhoto = _hasPhoto;
@synthesize hud = _hud;
@synthesize publicToCase = _publicToCase;

- (void)setDetailItem:(id)detailItem{
    if (_detailItem != detailItem) {
        _detailItem = detailItem;
        NSLog(@"_Detail = %@", _detailItem);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    _stretchableTableHeaderView = [HFStretchableTableHeaderView new];
//    [_stretchableTableHeaderView stretchHeaderForTableView:self.tableView withView:_stretchView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 168, 40)];
//    _titleLabel.textColor = mainOrangeColor;
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.font = [UIFont fontWithName:@"ProximaNova-Bold" size:17];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = _titleLabel;
    
//    _publicToCase = [PFObject objectWithClassName:kTaskCasesClassesKey];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _countDownNumber = 4;
    
    UITableViewCell *cell;
    NSIndexPath *indexpath;
    NSLog(@"_deta x = %@", _detailItem);
    
        if ([(PFObject *)_detailItem objectForKey:@"askNote"]) {
            indexpath = [NSIndexPath indexPathForRow:0 inSection:0];
            cell = [self.tableView cellForRowAtIndexPath:indexpath];
            [cell setAccessoryType:UITableViewCellAccessoryNone];
            
            self.taskTitle.text = [NSString stringWithFormat:@"[問題]：%@",[(PFObject *)_detailItem objectForKey:@"askNote"]];
            [self.taskTitle setTextColor:[UIColor blackColor]];
            self.taskSubTitle.text = nil;
            [self.taskTitleCeckMark setHidden:NO];
            _countDownNumber = _countDownNumber - 1;
        }
        
        if ([(PFObject *)_detailItem objectForKey:@"myDesc"]){
            indexpath = [NSIndexPath indexPathForRow:1 inSection:0];
            cell = [self.tableView cellForRowAtIndexPath:indexpath];
            [cell setAccessoryType:UITableViewCellAccessoryNone];
            self.taskDetail.text = [NSString stringWithFormat:@"[自介]：%@",[(PFObject *)_detailItem objectForKey:@"myDesc"]];
            [self.taskDetail setTextColor:[UIColor blackColor]];
            self.taskSubDetail.text = nil;
            [self.taskDetailCeckMark setHidden:NO];
            _countDownNumber = _countDownNumber - 1;
        }
        
        if ([(PFObject *)_detailItem objectForKey:@"endTime"]){
            indexpath = [NSIndexPath indexPathForRow:2 inSection:0];
            cell = [self.tableView cellForRowAtIndexPath:indexpath];
            [cell setAccessoryType:UITableViewCellAccessoryNone];
            self.taskTime.text = [NSString stringWithFormat:@"[時間]：%@", [(PFObject *)_detailItem objectForKey:@"endTime"]];
            [self.taskTime setTextColor:[UIColor blackColor]];
            self.taskSubTime.text = nil;
            [self.taskTimeCeckMark setHidden:NO];
            _countDownNumber = _countDownNumber - 1;
        }
        
        if ([(PFObject *)_detailItem objectForKey:@"toAddress"]){
            indexpath = [NSIndexPath indexPathForRow:3 inSection:0];
            cell = [self.tableView cellForRowAtIndexPath:indexpath];
            [cell setAccessoryType:UITableViewCellAccessoryNone];
            self.taskAddress.text = [NSString stringWithFormat:@"[地點]：%@",[(PFObject *)_detailItem objectForKey:@"toAddress"]];
            [self.taskAddress setTextColor:[UIColor blackColor]];
            [self.taskAddressCeckMark setHidden:NO];
            _countDownNumber = _countDownNumber - 1;
        }
        
//        if ([(PFObject *)_detailItem objectForKey:@"wishPay"]){
//            indexpath = [NSIndexPath indexPathForRow:4 inSection:0];
//            cell = [self.tableView cellForRowAtIndexPath:indexpath];
//            [cell setAccessoryType:UITableViewCellAccessoryNone];
//            NSLog(@"wish pay = %@", [(PFObject *)_detailItem objectForKey:kTaskWishPay]);
//            self.taskMoney.text = [NSString stringWithFormat:@"[價格]：%@",[(PFObject *)_detailItem objectForKey:kTaskWishPay]];
//            [self.taskMoney setTextColor:[UIColor blackColor]];
//            self.taskSubMoney.text = nil;
//            [self.taskMoneyCeckMark setHidden:NO];
//            _countDownNumber = _countDownNumber - 1;
//        }
    
//        if ([(PFObject *)_detailItem objectForKey:kTaskPhotoFile]) {
//            _hasPhoto = YES;
//            PFFile *photoFile = [(PFObject *)_detailItem objectForKey:kTaskPhotoFile];
//            [photoFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
//                [self.photoView setImage:[UIImage imageWithData:data]];
//            }];
//            [self.photoCeckMark setHidden:NO];
//        }else{
//            _hasPhoto = NO;
//        }
//    }
    
    
    if (_countDownNumber == 6) {
        _titleLabel.text = @"還有六步便可發送邀請";
    }else if (_countDownNumber == 5){
        _titleLabel.text = @"還有五步便可發送邀請";
    }else if (_countDownNumber == 4){
        _titleLabel.text = @"還有四步便可發送邀請";
    }else if (_countDownNumber == 3){
        _titleLabel.text = @"還有三步便可發送邀請";
    }else if (_countDownNumber == 2){
        _titleLabel.text = @"還有二步便可發送邀請";
    }else if (_countDownNumber == 1){
        _titleLabel.text = @"還有一步便可發送邀請";
    }else if (_countDownNumber == 0){
        _titleLabel.text = @"發送邀請！";
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    [_stretchableTableHeaderView scrollViewDidScroll:scrollView];
}

- (void)viewDidLayoutSubviews
{
//    [_stretchableTableHeaderView resizeView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (_countDownNumber == 0) {
        return 5;
    }else{
        return 4;
    }
    
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        //任務標題
        [self performSegueWithIdentifier:@"push1" sender:nil];
    }else if (indexPath.row == 1){
        //任務細節
        [self performSegueWithIdentifier:@"push2" sender:nil];
    }else if (indexPath.row == 2){
        //任務時間，代買代送(waitTime)、其他（startTime）
        [self performSegueWithIdentifier:@"push3" sender:nil];
    }else if (indexPath.row == 3){
        //任務地址，代買代送搬家(startAddress)、其他（setEndAddress）
        [self performSegueWithIdentifier:@"push4" sender:nil];
    }else if (indexPath.row == 4){
        [self postTask];
        //價格，代買代送小型班家（setBuy）、其他（setMoney）
//        if ([[[(PFObject *)_detailItem objectForKey:@"categoryID"] objectId] isEqualToString:@"hcCjRDoWfD"] || [[[(PFObject *)_detailItem objectForKey:@"categoryID"] objectId] isEqualToString:@"a9StQWOjod"] || [[[(PFObject *)_detailItem objectForKey:@"categoryID"] objectId] isEqualToString:@"dCQ5P3oULD"]) {
//            [self performSegueWithIdentifier:@"setBuy" sender:nil];
//        }else{
//            [self performSegueWithIdentifier:@"setMoney" sender:nil];
//        }
    }else if (indexPath.row == 5){
        //可選訊息(setOption)
        [self performSegueWithIdentifier:@"setOption" sender:nil];
    }else if (indexPath.row == 6){
        NSDate *now = [NSDate date];
//        NSDate *endtime= [(PFObject *)_detailItem objectForKey:kTaskEndTime];
        
//        if ((int)[endtime timeIntervalSinceDate:now] > 0) {
//            //還未過期
//            [self performSegueWithIdentifier:@"postTask" sender:nil];
//        }else{
//            //已經過期
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"發布提醒" message:@"此任務時間已經過期，將不會有人看到此任務，請重新設定。" delegate:self cancelButtonTitle:@"確定" otherButtonTitles:nil];
//            [alertView show];
//        }

    }
}

-(void)onTick:(NSTimer *)timer {
    [MBProgressHUD hideAllHUDsForView:self.view animated:true];
    [self dismissViewControllerAnimated:true completion:^{
        
    }];
    [blinkTimer invalidate];
}


- (void)postTask{
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [_hud setLabelText:[NSString stringWithFormat:@"準備發送邀請，請稍候"]];
    [_hud setDimBackground:YES];
    CFAbsoluteTime timeCheck;
    NSLog(@"====== Alex Test Area ======");
    timeCheck = CFAbsoluteTimeGetCurrent();
    
    if(!blinkTimer)
        blinkTimer = [NSTimer scheduledTimerWithTimeInterval: 3.0
                                                      target: self
                                                    selector:@selector(onTick:)
                                                    userInfo: nil repeats:YES];
    
    
    
//    [CMUtility experienceSaveTaskTo:_publicToCase fromCaseObject:(PFObject *)_detailItem onViewController:self block:^(BOOL succeeded, NSArray *objects) {
//        if (succeeded) {
//            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//            if (objects.count > 0) {
//                if ([[[objects objectAtIndex:0] class] isSubclassOfClass:[PFObject class]]) {
//                    //非選擇群組
//                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"任務登錄完畢" message:[NSString stringWithFormat:@"系統已通知%ld人\n. 若有幫手確認，您將會收到系統\n通知訊息", (unsigned long)objects.count] delegate:self cancelButtonTitle:nil otherButtonTitles:@"確定", nil];
//                    
//                    [alertView show];
//                    NSLog(@"Execution time=%.3f second(s).",(CFAbsoluteTimeGetCurrent()-timeCheck));
//                    NSLog(@"====== Alex Test Area END ======");
//                }else{
//                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"任務登錄完畢" message:[NSString stringWithFormat:@"系統已通知%ld人\n. 若有幫手確認，您將會收到系統\n通知訊息", (unsigned long)objects.count] delegate:self cancelButtonTitle:nil otherButtonTitles:@"確定", nil];
//                    
//                    [alertView show];
//                    NSLog(@"Execution time=%.3f second(s).",(CFAbsoluteTimeGetCurrent()-timeCheck));
//                    NSLog(@"====== Alex Test Area END ======");
//                }
//            }else{
//                //沒有找到適合的幫手，您是優質業主，是否幫你一鍵齊發至社團？
//                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"一鍵齊發" message:@"您是我們優質客戶，我們允許您將任務同步到Facebook打工社群，可觸及36萬以上幫手，您是否要將您的案件確分享到各大FB打工社團？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"確定", nil];
//                
//                [alertView show];
//                NSLog(@"Execution time=%.3f second(s).",(CFAbsoluteTimeGetCurrent()-timeCheck));
//                NSLog(@"====== Alex Test Area END ======");
//            }
//        }
//    }];
}

//導航至管理頁面的待確認
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if ([alertView.title isEqualToString:@"任務登錄完畢"]) {
        switch (buttonIndex) {
            case 0:{
                [[PFUser currentUser] refreshInBackgroundWithBlock:^(PFObject *object, NSError *error) {
                    //接下來是推播到社團去。但是得先確認用戶是不是優質用戶。
                    if ([[[PFUser currentUser] objectForKey:@"isGoodMaster"] boolValue]) {
                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"一鍵齊發" message:@"您是我們優質客戶，我們允許您將任務同步到Facebook打工社群，可觸及36萬以上幫手，您是否要將您的案件確分享到各大FB打工社團？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"確定", nil];
                        
                        [alertView show];
                    }else{
                        //不做任何事情，直接返回管理任務
                        [self dismissViewControllerAnimated:YES completion:^{
//                            [[AppDelegate sharedDelegate] presentTaskManager];
                        }];
                    }
                }];
            }
                break;
            case 1:
                NSLog(@"Cancel Button Pressed");
                break;
            default:
                break;
        }
    }else if ([alertView.title isEqualToString:@"一鍵齊發"]){
        switch (buttonIndex) {
            case 0:
                [self dismissViewControllerAnimated:YES completion:^{
                    NSLog(@"Cancel Button Pressed");
//                    [[AppDelegate sharedDelegate] presentTaskManager];
                }];
                break;
            case 1:
                //同意發布到Facebook社團，發布後返回管理任務。
                [self postToFacebookGroups];
                break;
            default:
                break;
        }
    }
}

- (void)postToFacebookGroups{
    NSLog(@"post case = %@", _publicToCase);
    [_publicToCase setObject:[NSNumber numberWithBool:TRUE] forKey:@"isShared"];
    
    PFACL *ACL = [PFACL ACL];
    [ACL setPublicReadAccess:YES];
    [ACL setPublicWriteAccess:YES];
    _publicToCase.ACL = ACL;
    
    [_publicToCase saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"成功分享");
//            [FBRequestConnection startWithGraphPath:@"/me/groups"
//                                         parameters:nil
//                                         HTTPMethod:@"GET"
//                                  completionHandler:^(
//                                                      FBRequestConnection *connection,
//                                                      id result,
//                                                      NSError *error
//                                                      ) {
//                                      if (!error) {
//                                          [self facebookRequestDidLoad:result];
//                                          //facebook 社團
//                                          [self shareOGStory:nil];
//                                      }else{
//                                          NSLog(@"error~!! = %@", error);
//                                      }
//                                  }];
        }
    }];
    
    //Post完成之後，直接返回管理任務
    [self dismissViewControllerAnimated:YES completion:^{
//        [[AppDelegate sharedDelegate] presentTaskManager];
    }];
}

- (void)dontPostToFacebookGroups{
    [_publicToCase setObject:[NSNumber numberWithBool:FALSE] forKey:@"isShared"];
    
    PFACL *ACL = [PFACL ACL];
    [ACL setPublicReadAccess:YES];
    [ACL setPublicWriteAccess:YES];
    [_publicToCase setACL:ACL];
    
    [_publicToCase saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"業主決定不分享");
        }
    }];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"push1"]) {
        CasePreviewTitleViewController *controller = segue.destinationViewController;
        [controller setDetailItem:(PFObject *)_detailItem];
    }else if ([segue.identifier isEqualToString:@"push2"]){
        CasePreviewTitleViewController2 *controller = segue.destinationViewController;
        [controller setDetailItem:(PFObject *)_detailItem];
    }else if ([segue.identifier isEqualToString:@"push3"]){
        CasePreviewTitleViewController3 *controller = segue.destinationViewController;
        [controller setDetailItem:(PFObject *)_detailItem];
//        PartTimeTableViewController *controller = segue.destinationViewController;
//        [controller setDetailItem:(PFObject *)_detailItem];
    }else if ([segue.identifier isEqualToString:@"push4"]){
        CasePreviewTitleViewController4 *controller = segue.destinationViewController;
        [controller setDetailItem:(PFObject *)_detailItem];
//        TimeAndMessengerTableViewController *controller = segue.destinationViewController;
//        [controller setDetailItem:(PFObject *)_detailItem];
    }else if ([segue.identifier isEqualToString:@"push5"]){
//        SetAddressTableViewController *controller = segue.destinationViewController;
//        [controller setDetailItem:(PFObject *)_detailItem];
    }else if ([segue.identifier isEqualToString:@"setBuy"]){
//        checkMoneyViewController *controller = segue.destinationViewController;
//        [controller setDetailItem:(PFObject *)_detailItem];
    }else if ([segue.identifier isEqualToString:@"setMoney"]){
//        PartTimeCheckMoneyViewController *controller = segue.destinationViewController;
//        [controller setDetailItem:(PFObject *)_detailItem];
    }else if ([segue.identifier isEqualToString:@"setOption"]){
//        SetOptionViewController *controller = segue.destinationViewController;
//        [controller setDetailItem:(PFObject *)_detailItem];
    }else if ([segue.identifier isEqualToString:@"postTask"]){
//        agreePageViewController *controller = segue.destinationViewController;
//        [controller setDetailItem:(PFObject *)_detailItem];
    }else if ([segue.identifier isEqualToString:@"setEndAdress"]){
//        ToViewController *controller = segue.destinationViewController;
//        [controller setDetailItem:(PFObject *)_detailItem];
    }
}


- (IBAction)cameraButtonPressed:(id)sender {
    NSLog(@"相機按鈕");
    BOOL cameraDeviceAvailable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    BOOL photoLibraryAvailable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
    
    if (cameraDeviceAvailable && photoLibraryAvailable) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍張照片", @"從相簿選擇", @"不使用照片",nil];
        [actionSheet showInView:self.view];
    } else {
        // if we don't have at least two options, we automatically show whichever is available (camera or roll)
        [self shouldPresentPhotoCaptureController];
    }
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self.navigationController dismissViewControllerAnimated:true completion:^{
        
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
#if TARGET_OS_IPHONE &&  (__IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0)
    [self dismissViewControllerAnimated:YES completion:nil];
#else
    [self dismissModalViewControllerAnimated:YES];
#endif
//    [self.commentTextView becomeFirstResponder];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
#if TARGET_OS_IPHONE &&  (__IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0)
    [self dismissViewControllerAnimated:YES completion:nil];
#else
    [self dismissModalViewControllerAnimated:YES];
#endif
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    self.photoView.image = image;
    _hasPhoto = YES;
    
    //開始上傳檔案。
    PFFile *photoFile = [PFFile fileWithData:UIImagePNGRepresentation(self.photoView.image)];
    
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [_hud setLabelText:[NSString stringWithFormat:@"儲存任務照片，請稍候"]];
    [_hud setDimBackground:YES];
    
    PFObject *saveCasePreview = (PFObject *)_detailItem;
    
    PFACL *ACL = [PFACL ACL];
    [ACL setPublicReadAccess:YES];
    [ACL setPublicWriteAccess:YES];
    saveCasePreview.ACL = ACL;
    
    UIImage *mediumImage = [self.photoView.image thumbnailImage:640 transparentBorder:0 cornerRadius:0 interpolationQuality:kCGInterpolationHigh];
    UIImage *smallRoundedImage = [self.photoView.image thumbnailImage:64 transparentBorder:0 cornerRadius:0 interpolationQuality:kCGInterpolationLow];
    
    NSData *mediumImageData = UIImagePNGRepresentation(mediumImage); // using JPEG for larger pictures
    NSData *smallRoundedImageData = UIImagePNGRepresentation(smallRoundedImage);
    
    if (mediumImageData.length > 0) {
        NSLog(@"中型照片上載中...1");
        PFFile *fileMediumImage = [PFFile fileWithData:mediumImageData];
        [fileMediumImage saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                NSLog(@"中型照片上載完成。1");
//                [saveCasePreview setObject:fileMediumImage forKey:kTaskPhotoFile];
//                [saveCasePreview saveEventually:^(BOOL succeeded, NSError *error) {
//                    if (succeeded) {
//                        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//                        [self.photoCeckMark setHidden:NO];
//                        NSLog(@"中型照片應該要確實上傳到資料庫。1");
//                    }else {
//                        NSLog(@"中型照片出錯囉！1%@",error);
//                    }
//                }];
            }
        }];
    }
    
    if (smallRoundedImageData.length > 0) {
        NSLog(@"小型個人檔案照片上載中...1");
        PFFile *fileSmallRoundedImage = [PFFile fileWithData:smallRoundedImageData];
        [fileSmallRoundedImage saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                NSLog(@"小型個人檔案照片上載完成。1");
                
//                [saveCasePreview setObject:fileSmallRoundedImage forKey:kTaskPhotoSmallFile];
//                [saveCasePreview saveEventually:^(BOOL succeeded, NSError *error) {
//                    if (succeeded) {
//                        NSLog(@"小型個人檔案照片應該要確實上傳到資料庫。1");
//                    }else{
//                        NSLog(@"小型個人檔案照片出錯囉！1%@",error);
//                    }
//                }];
            }
        }];
    }
}

- (BOOL)shouldPresentPhotoCaptureController {
    BOOL presentedPhotoCaptureController = [self shouldStartCameraController];
    
    if (!presentedPhotoCaptureController) {
        presentedPhotoCaptureController = [self shouldStartPhotoLibraryPickerController];
    }
    return presentedPhotoCaptureController;
}

- (BOOL)shouldStartCameraController {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == NO) {
        return NO;
    }
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]
        && [[UIImagePickerController availableMediaTypesForSourceType:
             UIImagePickerControllerSourceTypeCamera] containsObject:(NSString *)kUTTypeImage]) {
        
        cameraUI.mediaTypes = [NSArray arrayWithObject:(NSString *) kUTTypeImage];
        cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]) {
            cameraUI.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        } else if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]) {
            cameraUI.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        }
    } else {
        return NO;
    }
    cameraUI.allowsEditing = YES;
    cameraUI.showsCameraControls = YES;
    cameraUI.delegate = self;
    
#if TARGET_OS_IPHONE &&  (__IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0)
    [self presentViewController:cameraUI animated:YES completion:nil];
#else
    [self presentModalViewController:cameraUI animated:YES];
#endif
    
    return YES;
}

- (BOOL)shouldStartPhotoLibraryPickerController {
    if (([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary] == NO
         && [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum] == NO)) {
        return NO;
    }
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]
        && [[UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary] containsObject:(NSString *)kUTTypeImage]) {
        cameraUI.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        cameraUI.mediaTypes = [NSArray arrayWithObject:(NSString *) kUTTypeImage];
        
    } else if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]
               && [[UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum] containsObject:(NSString *)kUTTypeImage]) {
        cameraUI.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        cameraUI.mediaTypes = [NSArray arrayWithObject:(NSString *) kUTTypeImage];
    } else {
        return NO;
    }
    cameraUI.allowsEditing = YES;
    cameraUI.delegate = self;
#if TARGET_OS_IPHONE &&  (__IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0)
    [self presentViewController:cameraUI animated:YES completion:nil];
#else
    [self presentModalViewController:cameraUI animated:YES];
#endif
    return YES;
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //因為使用者所在位置會一直被用到，所以在這裡就不做release的動作了。否則會永遠沒辦法找到使用者。
    if (buttonIndex == 0) {
        [self shouldStartCameraController];
    } else if (buttonIndex == 1){
        [self shouldStartPhotoLibraryPickerController];
    } else if (buttonIndex == 2){
        self.photoView.image = [UIImage imageNamed:@"camera2"];
        _hasPhoto = NO;
        
        //移除照片檔案
    }
}



//--------------------------- start sharing OG story with API calls code -----------------------------

- (void)shareOGStory:(id)sender{
    // Check for publish permissions
//    [FBRequestConnection startWithGraphPath:@"/me/permissions"
//                          completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
//                              if (!error){
//                                  NSDictionary *permissions= [(NSArray *)[result data] objectAtIndex:0];
//                                  if (![permissions objectForKey:@"publish_actions"]){
//                                      // Permission hasn't been granted, so ask for publish_actions
//                                      [FBSession.activeSession requestNewPublishPermissions:[NSArray arrayWithObject:@"publish_actions"]
//                                                                            defaultAudience:FBSessionDefaultAudienceEveryone
//                                                                          completionHandler:^(FBSession *session, NSError *error) {
//                                                                              if (!error) {
//                                                                                  if ([FBSession.activeSession.permissions indexOfObject:@"publish_actions"] == NSNotFound){
//                                                                                      // Permission not granted, tell the user we will not share to Facebook
//                                                                                      NSLog(@"Permission not granted, we will not share to Facebook.");
//                                                                                      UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Permission not granted, we will not share to Facebook." delegate:self cancelButtonTitle:@"確定" otherButtonTitles:nil, nil];
//                                                                                      
//                                                                                      [alertView show];
//                                                                                  } else {
//                                                                                      // Permission granted, publish the OG story
//                                                                                      [self pickImageAndPublishStory];
//                                                                                  }
//                                                                                  
//                                                                              } else {
//                                                                                  // An error occurred, we need to handle the error
//                                                                                  // See: https://developers.facebook.com/docs/ios/errors
//                                                                                  NSLog(@"Encountered an error requesting permissions: %@", error.description);
//                                                                                  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"Encountered an error requesting permissions: %@", error.description] delegate:self cancelButtonTitle:@"確定" otherButtonTitles:nil, nil];
//                                                                                  
//                                                                                  [alertView show];
//                                                                              }
//                                                                          }];
//                                      
//                                  } else {
//                                      // Permissions present, publish the OG story
//                                      [self pickImageAndPublishStory];
//                                  }
//                                  
//                              } else {
//                                  // An error occurred, we need to handle the error
//                                  // See: https://developers.facebook.com/docs/ios/errors
//                                  NSLog(@"Encountered an error checking permissions: %@", error.description);
//                              }
//                          }];
}

- (void)pickImageAndPublishStory{
    // Get the image
    PFFile *imageFile;
    UIImage *image;
    if ([_publicToCase objectForKey:@"picMedium"]) {
//        imageFile = [_publicToCase objectForKey:@"picMedium"];
//        image = [UIImage imageWithData:imageFile.getData];
//        
//        // stage an image
//        [FBRequestConnection startForUploadStagingResourceWithImage:image completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
//            if(!error) {
//                NSLog(@"Successfuly staged image with staged URI: %@", [result objectForKey:@"uri"]);
//                
//                // instantiate a Facebook Open Graph object
//                NSMutableDictionary<FBOpenGraphObject> *object = [FBGraphObject openGraphObjectForPost];
//                
//                // specify that this Open Graph object will be posted to Facebook
//                object.provisionedForPost = YES;
//                
//                // for og:title
//                object[@"title"] = @"派送任務";
//                
//                // for og:type, this corresponds to the Namespace you've set for your app and the object type name
//                //            object[@"type"] = @"taiwaneight:task";
//#ifdef APP_STORE
//                object[@"type"] = @"taiwaneight:message"; //台灣幫
//#else
//                object[@"type"] = @"taiwaneight:message"; //台灣幫開發用資料庫
//#endif
//                
//                
//                // for og:description
//                object[@"description"] = [NSString stringWithFormat:@"費用：%@元, 任務：%@", [_publicToCase objectForKey:@"wishPay"], [_publicToCase objectForKey:@"note"]];
//                
//                NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
//                dateFormatter.dateFormat = @"yyyy/MM/dd hh:mm a";
//                
//                NSString *message;
//                NSString *paymethod;
//                if ([[_publicToCase objectForKey:@"paymentMethod"] isEqualToString:@"tt"]) {
//                    paymethod = @"匯款";
//                }else if ([[_publicToCase objectForKey:@"paymentMethod"] isEqualToString:@"cash"]){
//                    paymethod = @"現金";
//                }
//                
//                if ([[[_publicToCase objectForKey:kTaskCategory] objectId] isEqualToString:@"mFfuo0LMqe"] || [[[_publicToCase objectForKey:kTaskCategory] objectId] isEqualToString:@"TGDvw0pMB4"]) {
//#ifdef APP_STORE
//                    message = [NSString stringWithFormat:@"工作標題：%@\n工作類別：%@\n工作內容：%@\n需求人數：%@位\n工作日期：%@~%@\n工作地點：%@ %@\n工作費用：%@%@元\n\n\n\n請下載台灣幫App或至下列網站回覆接案\nhttp://taiwan8.com.tw/casesdetail/index/%@", [_publicToCase objectForKey:@"note"], [[_publicToCase objectForKey:@"categoryID"] objectForKey:@"name"], [_publicToCase objectForKey:@"caseDesc"], [_publicToCase objectForKey:@"peopleAmount"], [dateFormatter stringFromDate:[_publicToCase objectForKey:@"startTime"]], [dateFormatter stringFromDate:[_publicToCase objectForKey:@"endTime"]], [_publicToCase objectForKey:@"toAdministrativeArea"], [_publicToCase objectForKey:@"toCity"], paymethod, [_publicToCase objectForKey:@"wishPay"], _publicToCase.objectId]; //台灣幫
//#else
//                    message = [NSString stringWithFormat:@"工作標題：%@\n工作類別：%@\n工作內容：%@\n需求人數：%@位\n工作日期：%@~%@\n工作地點：%@ %@\n工作費用：%@%@元\n\n\n\n請下載台灣幫App或至下列網站回覆接案\nhttp://testsite.taiwan8.com.tw/casesdetail/index/%@", [_publicToCase objectForKey:@"note"], [[_publicToCase objectForKey:@"categoryID"] objectForKey:@"name"], [_publicToCase objectForKey:@"caseDesc"], [_publicToCase objectForKey:@"peopleAmount"], [dateFormatter stringFromDate:[_publicToCase objectForKey:@"startTime"]], [dateFormatter stringFromDate:[_publicToCase objectForKey:@"endTime"]], [_publicToCase objectForKey:@"toAdministrativeArea"], [_publicToCase objectForKey:@"toCity"], paymethod, [_publicToCase objectForKey:@"wishPay"], _publicToCase.objectId]; //台灣幫開發用資料庫
//#endif
//                }else{
//#ifdef APP_STORE
//                    message = [NSString stringWithFormat:@"工作標題：%@\n工作類別：%@\n工作內容：%@\n需求人數：%@位\n工作日期：%@~%@\n工作地點：%@ %@\n工作費用：%@%@元\n\n\n\n請下載台灣幫App或至下列網站回覆接案\nhttp://taiwan8.com.tw/casesdetail/index/%@", [_publicToCase objectForKey:@"note"], [[_publicToCase objectForKey:@"categoryID"] objectForKey:@"name"], [_publicToCase objectForKey:@"caseDesc"], [_publicToCase objectForKey:@"peopleAmount"], [dateFormatter stringFromDate:[_publicToCase objectForKey:@"startTime"]], [dateFormatter stringFromDate:[_publicToCase objectForKey:@"endTime"]], [_publicToCase objectForKey:@"toAdministrativeArea"], [_publicToCase objectForKey:@"toCity"], paymethod, [_publicToCase objectForKey:@"wishPay"], _publicToCase.objectId]; //台灣幫
//#else
//                    message = [NSString stringWithFormat:@"工作標題：%@\n工作類別：%@\n工作內容：%@\n需求人數：%@位\n工作日期：%@~%@\n工作地點：%@ %@\n工作費用：%@%@元\n\n\n\n請下載台灣幫App或至下列網站回覆接案\nhttp://testsite.taiwan8.com.tw/casesdetail/index/%@", [_publicToCase objectForKey:@"note"], [[_publicToCase objectForKey:@"categoryID"] objectForKey:@"name"], [_publicToCase objectForKey:@"caseDesc"], [_publicToCase objectForKey:@"peopleAmount"], [dateFormatter stringFromDate:[_publicToCase objectForKey:@"startTime"]], [dateFormatter stringFromDate:[_publicToCase objectForKey:@"endTime"]], [_publicToCase objectForKey:@"toAdministrativeArea"], [_publicToCase objectForKey:@"toCity"], paymethod, [_publicToCase objectForKey:@"wishPay"], _publicToCase.objectId]; //台灣幫開發用資料庫
//#endif
//                }
//                
//                object[@"message"] = message;
//                
//                // for og:url, we cover how this is used in the "Deep Linking" section below
//                // for og:url, we cover how this is used in the "Deep Linking" section below , fb399868383485636://authorize#target_url=
//                NSString *url = [NSString stringWithFormat:@"http://taiwan8.com.tw/casesdetail/index/%@", _publicToCase.objectId];
//                object[@"url"] = url;
//                
//                // for og:image we assign the uri of the image that we just staged
//                object[@"image"] = @[@{@"url": [result objectForKey:@"uri"], @"user_generated" : @"false" }];
//                
//                NSArray *facebookGroups = [[CMCache sharedCache] facebookGroups];
//                NSLog(@"facebook groups = %@", facebookGroups);
//                
//                
//                for (int i= 0; i < facebookGroups.count; i++) {
//                    NSLog(@"facebook group id = %@", [[facebookGroups objectAtIndex:i] objectForKey:@"id"]);
//                    
//#ifdef APP_STORE
//                    if ([[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"192414784133675"] || //OUR WORK IS OUR PLAY
//                        [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"315063158519102"] || //打工狂熱份子
//                        [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"261964593899246"] || //9i活動打工工讀專區
//                        [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"162352643817753"] || //打工丸
//                        [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"179588052178713"] || //打工一族
//                        [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"103471643191080"] || //台北打工
//                        [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"248963081912008"] || //台中打工
//                        [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"135995733258659"] || //台南打工
//                        [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"585660288130927"] || //高雄打工
//                        [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"196273263906631"] || //不怕沒工作只怕你不來
//                        [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"214666455289762"] || //全台最大打工資訊站
//                        [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"194156780626450"]    //工讀打工專區，工作多多
//                        ) {
//                        [FBRequestConnection startForPostWithGraphPath:[NSString stringWithFormat:@"%@/feed", [[facebookGroups objectAtIndex:i] objectForKey:@"id"]] graphObject:object completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
//                            if(!error) {
//                                
//                                NSLog(@"OG story posted, story id: %@", [result objectForKey:@"id"]);
//                            } else {
//                                // An error occurred, we need to handle the error
//                                // See: https://developers.facebook.com/docs/ios/errors
//                                NSLog(@"Encountered an error posting to Open Graph: %@", error.description);
//                            }
//                        }];
//                    } //台灣幫
//#else
//                    if ([[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"480121048800866"] ||
//                        [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"520004931466816"]) {
//                        [FBRequestConnection startForPostWithGraphPath:[NSString stringWithFormat:@"%@/feed", [[facebookGroups objectAtIndex:i] objectForKey:@"id"]] graphObject:object completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
//                            if(!error) {
//                                NSLog(@"OG story posted, story id: %@ \n result = %@", [result objectForKey:@"id"], result);
//                                
//                            } else {
//                                // An error occurred, we need to handle the error
//                                // See: https://developers.facebook.com/docs/ios/errors
//                                NSLog(@"Encountered an error posting to Open Graph x: %@", error.description);
//                            }
//                        }];
//                    } //台灣幫開發用資料庫
//#endif
//                }
//            } else {
//                // An error occurred, we need to handle the error
//                // See: https://developers.facebook.com/docs/ios/errors
//                NSLog(@"Error staging an image: %@", error.description);
//            }
//        }];
    }else{
        //        NSLog(@"Successfuly staged image with staged URI: %@", [result objectForKey:@"uri"]);
        
        // instantiate a Facebook Open Graph object
//        NSMutableDictionary<FBOpenGraphObject> *object = [FBGraphObject openGraphObjectForPost];
//        
//        // specify that this Open Graph object will be posted to Facebook
//        object.provisionedForPost = YES;
//        
//        // for og:title
//        object[@"title"] = @"派送任務";
//        
//        // for og:type, this corresponds to the Namespace you've set for your app and the object type name
//        //            object[@"type"] = @"taiwaneight:task";
//        object[@"type"] = @"taiwaneight:task";
//        
//        // for og:description
//        object[@"description"] = [NSString stringWithFormat:@"費用：%@元, 任務：%@", [_publicToCase objectForKey:@"wishPay"], [_publicToCase objectForKey:@"note"]];
//        
//        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
//        dateFormatter.dateFormat = @"yyyy/MM/dd";
//        
//        NSString *message;
//        NSString *paymethod;
//        NSMutableArray *postStoryIDArray;
//        __block BOOL isShared = false;
//        
//        if ([[_publicToCase objectForKey:@"paymentMethod"] isEqualToString:@"tt"]) {
//            paymethod = @"匯款";
//        }else if ([[_publicToCase objectForKey:@"paymentMethod"] isEqualToString:@"cash"]){
//            paymethod = @"現金";
//        }
//        
//        if ([[[_publicToCase objectForKey:kTaskCategory] objectId] isEqualToString:@"mFfuo0LMqe"] || [[[_publicToCase objectForKey:kTaskCategory] objectId] isEqualToString:@"TGDvw0pMB4"]) {
//#ifdef APP_STORE
//            message = [NSString stringWithFormat:@"工作標題：%@\n工作類別：%@\n工作內容：%@\n需求人數：%@位\n工作日期：%@~%@\n工作地點：%@ %@\n工作費用：%@%@元\n\n\n\n請下載台灣幫App或至下列網站回覆接案\nhttp://taiwan8.com.tw/casesdetail/index/%@", [_publicToCase objectForKey:@"note"], [[_publicToCase objectForKey:@"categoryID"] objectForKey:@"name"], [_publicToCase objectForKey:@"caseDesc"], [_publicToCase objectForKey:@"peopleAmount"], [dateFormatter stringFromDate:[_publicToCase objectForKey:@"startTime"]], [dateFormatter stringFromDate:[_publicToCase objectForKey:@"endTime"]], [_publicToCase objectForKey:@"toAdministrativeArea"], [_publicToCase objectForKey:@"toCity"], paymethod, [_publicToCase objectForKey:@"wishPay"], _publicToCase.objectId]; //台灣幫
//#else
//            message = [NSString stringWithFormat:@"工作標題：%@\n工作類別：%@\n工作內容：%@\n需求人數：%@位\n工作日期：%@~%@\n工作地點：%@ %@\n工作費用：%@%@元\n\n\n\n請下載台灣幫App或至下列網站回覆接案\nhttp://testsite.taiwan8.com.tw/casesdetail/index/%@", [_publicToCase objectForKey:@"note"], [[_publicToCase objectForKey:@"categoryID"] objectForKey:@"name"], [_publicToCase objectForKey:@"caseDesc"], [_publicToCase objectForKey:@"peopleAmount"], [dateFormatter stringFromDate:[_publicToCase objectForKey:@"startTime"]], [dateFormatter stringFromDate:[_publicToCase objectForKey:@"endTime"]], [_publicToCase objectForKey:@"toAdministrativeArea"], [_publicToCase objectForKey:@"toCity"], paymethod, [_publicToCase objectForKey:@"wishPay"], _publicToCase.objectId]; //台灣幫開發用資料庫
//#endif
//            object[@"message"] = message;
//        }else{
//#ifdef APP_STORE
//            message = [NSString stringWithFormat:@"工作標題：%@\n工作類別：%@\n工作內容：%@\n需求人數：%@位\n工作日期：%@~%@\n工作地點：%@ %@\n工作費用：%@%@元\n\n\n\n請下載台灣幫App或至下列網站回覆接案\nhttp://taiwan8.com.tw/casesdetail/index/%@", [_publicToCase objectForKey:@"note"], [[_publicToCase objectForKey:@"categoryID"] objectForKey:@"name"], [_publicToCase objectForKey:@"caseDesc"], [_publicToCase objectForKey:@"peopleAmount"], [dateFormatter stringFromDate:[_publicToCase objectForKey:@"startTime"]], [dateFormatter stringFromDate:[_publicToCase objectForKey:@"endTime"]], [_publicToCase objectForKey:@"toAdministrativeArea"], [_publicToCase objectForKey:@"toCity"], paymethod, [_publicToCase objectForKey:@"wishPay"], _publicToCase.objectId]; //台灣幫
//#else
//            message = [NSString stringWithFormat:@"工作標題：%@\n工作類別：%@\n工作內容：%@\n需求人數：%@位\n工作日期：%@~%@\n工作地點：%@ %@\n工作費用：%@%@元\n\n\n\n請下載台灣幫App或至下列網站回覆接案\nhttp://testsite.taiwan8.com.tw/casesdetail/index/%@", [_publicToCase objectForKey:@"note"], [[_publicToCase objectForKey:@"categoryID"] objectForKey:@"name"], [_publicToCase objectForKey:@"caseDesc"], [_publicToCase objectForKey:@"peopleAmount"], [dateFormatter stringFromDate:[_publicToCase objectForKey:@"startTime"]], [dateFormatter stringFromDate:[_publicToCase objectForKey:@"endTime"]], [_publicToCase objectForKey:@"toAdministrativeArea"], [_publicToCase objectForKey:@"toCity"], paymethod, [_publicToCase objectForKey:@"wishPay"], _publicToCase.objectId]; //台灣幫開發用資料庫
//#endif
//            object[@"message"] = message;
//        }
//        
//        
//        
//        // for og:url, we cover how this is used in the "Deep Linking" section below , fb399868383485636://authorize#target_url=
//        NSString *url = [NSString stringWithFormat:@"http://taiwan8.com.tw/casesdetail/index/%@", _publicToCase.objectId];
//        object[@"url"] = url;
//        
//        // for og:image we assign the uri of the image that we just staged
//        //        object[@"image"] = @[@{@"url": @"http://taiwan8.com.tw/assets/frontend/layout/img/logos/logo-tw8-top-v3.png", @"user_generated" : @"false" }];
//        
//        NSArray *facebookGroups = [[CMCache sharedCache] facebookGroups];
//        NSLog(@"facebook groups = %@", facebookGroups);
//        
//        
//        for (int i= 0; i < facebookGroups.count; i++) {
//            NSLog(@"facebook group id = %@", [[facebookGroups objectAtIndex:i] objectForKey:@"id"]);
//#ifdef APP_STORE
//            if ([[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"192414784133675"] || //OUR WORK IS OUR PLAY
//                [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"315063158519102"] || //打工狂熱份子
//                [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"261964593899246"] || //9i活動打工工讀專區
//                [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"162352643817753"] || //打工丸
//                [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"179588052178713"] || //打工一族
//                [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"103471643191080"] || //臺北打工
//                [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"248963081912008"] || //台中打工
//                [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"390719491094973"] || //台南打工
//                [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"585660288130927"] || //高雄打工
//                [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"196273263906631"] || //不怕沒工作只怕你不來
//                [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"214666455289762"] || //全台最大打工資訊站
//                [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"194156780626450"]    //工讀打工專區，工作多多
//                ) {
//                [FBRequestConnection startForPostWithGraphPath:[NSString stringWithFormat:@"%@/feed", [[facebookGroups objectAtIndex:i] objectForKey:@"id"]] graphObject:object completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
//                    if (!error) {
//                        if(!error) {
//                            
//                            NSLog(@"OG story posted, story id: %@", [result objectForKey:@"id"]);
//                            [postStoryIDArray addObject:[result objectForKey:@"id"]];
//                            isShared = TRUE;
//                        } else {
//                            // An error occurred, we need to handle the error
//                            // See: https://developers.facebook.com/docs/ios/errors
//                            NSLog(@"Encountered an error posting to Open Graph: %@", error.description);
//                        }
//                    }else{
//                        // An error occurred, we need to handle the error
//                        // See: https://developers.facebook.com/docs/ios/errors
//                        NSLog(@"Encountered an error posting to Open Graph: %@", error.description);
//                    }
//                }];
//            } //台灣幫
//#else
//            if ([[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"480121048800866"] ||
//                [[[facebookGroups objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"520004931466816"]) {
//                [FBRequestConnection startForPostWithGraphPath:[NSString stringWithFormat:@"%@/feed", [[facebookGroups objectAtIndex:i] objectForKey:@"id"]] graphObject:object completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
//                    if (!error) {
//                        if(!error) {
//                            NSLog(@"OG story posted, story id: %@", [result objectForKey:@"id"]);
//                            [postStoryIDArray addObject:[result objectForKey:@"id"]];
//                            isShared = TRUE;
//                        } else {
//                            // An error occurred, we need to handle the error
//                            // See: https://developers.facebook.com/docs/ios/errors
//                            NSLog(@"Encountered an error posting to Open Graph: %@", error.description);
//                        }
//                    }else{
//                        // An error occurred, we need to handle the error
//                        // See: https://developers.facebook.com/docs/ios/errors
//                        NSLog(@"Encountered an error posting to Open Graph: %@", error.description);
//                    }
//                }];
//            } //台灣幫開發用資料庫
//#endif
//            
//            if (isShared) {
//                [_publicToCase setObject:[NSNumber numberWithBool:TRUE] forKey:@"isShared"];
//                [_publicToCase setObject:postStoryIDArray forKey:@"fbPostID"];
//                
//                PFACL *ACL = [PFACL ACL];
//                [ACL setPublicReadAccess:YES];
//                [ACL setPublicWriteAccess:YES];
//                _publicToCase.ACL = ACL;
//                
//                [_publicToCase saveEventually:^(BOOL succeeded, NSError *error) {
//                    if (succeeded) {
//                        NSLog(@"成功回存isShared");
//                    }
//                }];
//            }
//        }
    }
}
//--------------------------- end sharing OG story with API calls code -----------------------------


#pragma mark - Facebook Request Delegate
- (void)facebookRequestDidLoad:(id)result {
    // This method is called twice - once for the user's /me profile, and a second time when obtaining their friends. We will try and handle both scenarios in a single method.
//    PFUser *user = [PFUser currentUser];
    
//    NSArray *data = [result objectForKey:@"data"];
//    NSDictionary *datatotalNumber = [result objectForKey:@"summary"];
    //    NSLog(@"result xxxx = %@, total = %@", data, datatotalNumber);
    
    
    /*如果是朋友
     {
     {
     "first_name" = "\U99ff\U9038";
     id = 10152382380208592;
     "last_name" = "\U9673";
     name = "\U9673\U99ff\U9038";
     }, {
     下一個
     }
     }
     */
    /*如果是社團資料
     {
     "bookmark_order" = 9;
     id = 180818658634248;
     name = "\U674e\U5967\U4eba\U529b\U6d3e\U9063\U7db2";
     unread = 7;
     }, {
     下1個
     }
     */
    
    
//    if (data) {
//        // we have friends data
//        NSMutableArray *facebookIds = [[NSMutableArray alloc] initWithCapacity:[data count]];
//        NSMutableArray *groupsIds = [[NSMutableArray alloc] initWithCapacity:[data count]];
//        NSMutableArray *groups = [[NSMutableArray alloc] initWithCapacity:[data count]];
//        NSNumber *facebooksNumber = [datatotalNumber objectForKey:@"total_count"];
//        for (NSDictionary *Datas in data) {
//            if (Datas[@"bookmark_order"]) {
//                if (Datas[@"id"]) {
//                    [groupsIds addObject:Datas[@"id"]];
//                    [groups addObject:Datas];
//                }
//            }else{
//                if (Datas[@"id"]) {
//                    [facebookIds addObject:Datas[@"id"]];
//                }
//            }
//        }
//        // cache friend data
//        if (facebookIds.count > 0) {
//            [[CMCache sharedCache] setFacebookFriends:facebookIds];
//        }
//        
//        if (facebooksNumber) {
//            [[CMCache sharedCache] setFacebookFriendsNumber:facebooksNumber];
//            [[PFUser currentUser] setObject:facebooksNumber forKey:@"FBFriendsNumber"];
//            
//            PFACL *ACL = [PFACL ACL];
//            [ACL setPublicReadAccess:YES];
//            [PFUser currentUser].ACL = ACL;
//            
//            [[PFUser currentUser] saveEventually:^(BOOL succeeded, NSError *error) {
//                if (succeeded) {
//                    NSLog(@"儲存好友數量");
//                }
//            }];
//        }
//        
//        if (groupsIds.count > 0) {
//            [[CMCache sharedCache] setFacebookGroups:groups];
//        }
//        
//        
//        
//        if (user) {
//            if (![user objectForKey:kPAPUserAlreadyAutoFollowedFacebookFriendsKey]) {
//                
//            }else{
//                [user setObject:[NSNumber numberWithInteger:facebookIds.count] forKey:@"FBFriends"];
//            }
//            PFACL *ACL = [PFACL ACL];
//            [ACL setPublicReadAccess:YES];
//            user.ACL = ACL;
//            
//            [user saveEventually];
//            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//        } else {
//            NSLog(@"No user session found. Forcing logOut.");
////            [(AppDelegate*)[[UIApplication sharedApplication] delegate] logOut];
//        }
//    } else {
//        self.hud.labelText = NSLocalizedString(@"Creating Profile", nil);
//        NSString *facebookId = [result objectForKey:@"id"];
//        NSString *facebookName = [result objectForKey:@"name"];
//        //新增用戶資料 名字、姓氏、性別、地區(用Graph API的代號)
//        NSString *facebookFirst_Name = [result objectForKey:@"first_name"];
//        NSString *facebookLast_Name = [result objectForKey:@"last_name"];
//        NSString *facebookBirthday = [result objectForKey:@"birthday"];
//        NSString *facebookEmail = [result objectForKey:@"email"];
//        NSString *facebookGender = [result objectForKey:@"gender"];
//        NSString *facebookLocation = [result objectForKey:@"locale"];
//        NSString *facebookSchool = [result objectForKey:@"school"];
//        NSString *facebookJob = [result objectForKey:@"employer"];
//        
//        if (user) {
//            if (facebookName && [facebookName length] != 0) {
//                [user setObject:facebookName forKey:kPAPUserDisplayNameKey];
//            } else {
//                [user setObject:@"某人" forKey:kPAPUserDisplayNameKey];
//            }
//            if (facebookId && [facebookId length] != 0) {
//                [user setObject:facebookId forKey:kPAPUserFacebookIDKey];
//            }
//            //儲存姓氏
//            if (facebookFirst_Name && facebookFirst_Name != 0) {
//                [[PFUser currentUser] setObject:facebookFirst_Name forKey:kPAPUserFacebookFirstNameKey];
//            }
//            //儲存名字
//            if (facebookLast_Name && facebookLast_Name != 0) {
//                [[PFUser currentUser] setObject:facebookLast_Name forKey:kPAPUserFacebookLastNameKey];
//            }
//            //儲存生日
//            if (facebookBirthday && facebookBirthday != 0) {
//                [[PFUser currentUser] setObject:facebookBirthday forKey:kPAPUserFacebookBirthdayKey];
//            }
//            //儲存email
//            if (facebookEmail && facebookEmail != 0) {
//                [[PFUser currentUser] setObject:facebookEmail forKey:kPAPUserFacebookEmailKey];
//            }
//            //儲存性別
//            if (facebookGender && facebookGender != 0) {
//                [[PFUser currentUser] setObject:facebookGender forKey:kPAPUserFacebookGenderKey];
//            }
//            //儲存地理位置
//            if (facebookLocation && facebookLocation != 0) {
//                [[PFUser currentUser] setObject:facebookLocation forKey:kPAPUserFacebookLocalsKey];
//            }
//            //儲存學校
//            if (facebookSchool && facebookSchool != 0) {
//                [[PFUser currentUser] setObject:facebookSchool forKey:@"school"];
//            }
//            if (facebookJob && facebookJob != 0) {
//                [[PFUser currentUser] setObject:facebookJob forKey:@"existingJob"];
//            }
//            
//            //設定新用戶預設為乘車客人
//            [[PFUser currentUser] setObject:kPAPUserTypeCustomerKey forKey:kPAPUserTypeKey];
//            //設定新用戶有接案跟發案上限
//            [[PFUser currentUser] setObject:@3 forKey:kPAPUserMaxPostQuotaKey];
//            [[PFUser currentUser] setObject:@3 forKey:kPAPUserMaxReceiveQuotaKey];
//            
//            //設定新用戶接收頻率為10, 等級為1~10
//            //            [[PFUser currentUser] setObject:[NSNumber numberWithInt:10] forKey:kPAPUserFrequencyKey];
//            
//            //            if (user.isNew) {
//            NSLog(@"正在下載用戶檔案照片...delegate");
//            // Download user's profile picture
//            NSURL *profilePictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", [user objectForKey:kPAPUserFacebookIDKey]]];
//            // Facebook profile picture cache policy: Expires in 2 weeks
//            NSURLRequest *profilePictureURLRequest = [NSURLRequest requestWithURL:profilePictureURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:0.0f];
//            [NSURLConnection connectionWithRequest:profilePictureURLRequest delegate:self];
//            //            }else{
//            //
//            //            }
//            
//            
//            PFACL *ACL = [PFACL ACL];
//            [ACL setPublicReadAccess:YES];
//            [PFUser currentUser].ACL = ACL;
//            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//            [[PFUser currentUser] saveEventually:^(BOOL succeeded, NSError *error) {
//                if (succeeded) {
//                    [[PFUser currentUser] refreshInBackgroundWithBlock:^(PFObject *object, NSError *error) {
//                        
//                    }];
//                }
//            }];
//        }
    
        
//        [FBRequestConnection startForMyFriendsWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
//            if (!error) {
//                //                NSLog(@"result 2 = %@", result);
//                [self facebookRequestDidLoad:result];
//            } else {
//                [self facebookRequestDidFailWithError:error];
//            }
//        }];
//    }
}

- (void)facebookRequestDidFailWithError:(NSError *)error {
    NSLog(@"Facebook error: %@", error);
    
    if ([PFUser currentUser]) {
        if ([[error userInfo][@"error"][@"type"] isEqualToString:@"OAuthException"]) {
            NSLog(@"The Facebook token was invalidated. Logging out.");
//            [(AppDelegate*)[[UIApplication sharedApplication] delegate] logOut];
        }
    }
}

@end
