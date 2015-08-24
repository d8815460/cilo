//
//  WebViewController.m
//  Cilo
//
//  Created by 駿逸 陳 on 2015/8/23.
//  Copyright (c) 2015年 駿逸 陳. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //設定網址
    NSString *urlString = [NSString stringWithFormat:@"https://docs.google.com/forms/d/1nJ-yaL03BojjFIK4-uQHMx_42A5HHTABhdL8y0gZyrw/viewform"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
