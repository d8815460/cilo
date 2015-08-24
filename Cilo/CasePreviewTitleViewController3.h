//
//  CasePreviewTitleViewController.h
//  taiwan8
//
//  Created by ALEX on 2014/12/17.
//  Copyright (c) 2014年 taiwan8. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>

@interface CasePreviewTitleViewController3 : UIViewController <UITextViewDelegate, UIAlertViewDelegate>
@property (nonatomic, strong) id detailItem;
@property (nonatomic, strong) MBProgressHUD *hud;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UILabel *textLabel;
- (IBAction)saveButtonPressed:(id)sender;
@end
