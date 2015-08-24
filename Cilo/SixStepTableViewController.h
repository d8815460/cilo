//
//  SixStepTableViewController.h
//  taiwan8
//
//  Created by ALEX on 2014/12/17.
//  Copyright (c) 2014年 taiwan8. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "HFStretchableTableHeaderView.h"
#import <MBProgressHUD.h>

@interface SixStepTableViewController : UITableViewController <UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *stretchView;
//@property (nonatomic, strong) HFStretchableTableHeaderView* stretchableTableHeaderView;
@property (nonatomic, strong) id detailItem;
@property (strong, nonatomic) IBOutlet UILabel *taskTitle;
@property (strong, nonatomic) IBOutlet UILabel *taskSubTitle;
@property (strong, nonatomic) IBOutlet UILabel *taskDetail;
@property (strong, nonatomic) IBOutlet UILabel *taskSubDetail;
@property (strong, nonatomic) IBOutlet UILabel *taskTime;
@property (strong, nonatomic) IBOutlet UILabel *taskSubTime;
@property (strong, nonatomic) IBOutlet UILabel *taskAddress;
@property (strong, nonatomic) IBOutlet UILabel *taskMoney;
@property (strong, nonatomic) IBOutlet UILabel *taskSubMoney;
@property (strong, nonatomic) IBOutlet UIImageView *photoView;

@property (strong, nonatomic) IBOutlet UILabel *taskTitleCeckMark;
@property (strong, nonatomic) IBOutlet UILabel *taskDetailCeckMark;
@property (strong, nonatomic) IBOutlet UILabel *taskTimeCeckMark;
@property (strong, nonatomic) IBOutlet UILabel *taskAddressCeckMark;
@property (strong, nonatomic) IBOutlet UILabel *taskMoneyCeckMark;
@property (strong, nonatomic) IBOutlet UILabel *photoCeckMark;

@property (nonatomic, strong) MBProgressHUD *hud;
@property (nonatomic) BOOL hasPhoto;
@property (nonatomic) int countDownNumber;
@property (nonatomic, strong) PFObject *publicToCase;//從預覽Case 發到真實Case

- (IBAction)cameraButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;
@end
