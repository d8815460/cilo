//
//  CasePreviewTitleViewController.m
//  taiwan8
//
//  Created by ALEX on 2014/12/17.
//  Copyright (c) 2014年 taiwan8. All rights reserved.
//

#import "CasePreviewTitleViewController2.h"

@interface CasePreviewTitleViewController2 (){
    NSTimer *blinkTimer;
}

@end

@implementation CasePreviewTitleViewController2
@synthesize textView = _textView;
@synthesize detailItem = _detailItem;
@synthesize hud = _hud;
@synthesize textLabel = _textLabel;

- (void)setDetailItem:(id)detailItem{
    if (_detailItem != detailItem) {
        _detailItem = detailItem;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [_textView becomeFirstResponder];
    
    if(!blinkTimer)
        blinkTimer = [NSTimer scheduledTimerWithTimeInterval: 1.0
                                                      target: self
                                                    selector:@selector(onTick:)
                                                    userInfo: nil repeats:YES];
}

-(void)onTick:(NSTimer *)timer {
    [_textView becomeFirstResponder];
    [blinkTimer invalidate];
    blinkTimer = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _textView.delegate = self;
//    [_textView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)textViewDidChange:(UITextView *)textView{
    if (textView.text.length > 0) {
        [_textLabel setHidden:YES];
    }else{
        [_textLabel setHidden:NO];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (IBAction)saveButtonPressed:(id)sender {
    [_textView resignFirstResponder];
    
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [_hud setLabelText:[NSString stringWithFormat:@"儲存自我介紹，請稍候"]];
    [_hud setDimBackground:YES];
    
    PFObject *saveCasePreview = (PFObject *)_detailItem;
    [saveCasePreview setObject:_textView.text forKey:@"myDesc"];
    
    PFACL *ACL = [PFACL ACL];
    [ACL setPublicReadAccess:YES];
    [ACL setPublicWriteAccess:YES];
    saveCasePreview.ACL = ACL;
    
    [saveCasePreview saveEventually:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"儲存過程發生錯誤" message:[NSString stringWithFormat:@"error:%@", [error description]] delegate:self cancelButtonTitle:@"確定" otherButtonTitles:nil];
            [alertView show];
        }
    }];
}
@end
