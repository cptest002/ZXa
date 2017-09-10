//
//  NewwebviewVC.m
//  出彩运动
//
//  Created by jack ma on 2017/8/5.
//  Copyright © 2017年 msq. All rights reserved.
//

#import "NewwebviewVC.h"
@interface NewwebviewVC ()<UIWebViewDelegate>

@end

@implementation NewwebviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
    web.delegate = self;
    [self.view addSubview:web];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
//    [SVProgressHUD  showWithStatus:@"正在加载"];

}

-(void)webViewDidFinishLoad:(UIWebView *)webView{

//    [SVProgressHUD dismiss];
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
