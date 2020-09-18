//
//  ViewController.m
//  AlertViewActionSheet
//
//  Created by Bytedance on 2020/5/20.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface ViewController ()

@property (nonatomic,strong) UIActivityIndicatorView *actyIndicatorView;
@property (nonatomic,strong) UIProgressView *progressView;
@property (nonatomic,strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加警告框和操作表
//    [self addAlertViewAndActionSheet];
    //添加活动指示器和进度条
//    [self addIndicatorViewAndProgressView];
}

#pragma mark -警告框和操作表
- (void)addAlertViewAndActionSheet
{
    
    CGRect screen = [[UIScreen mainScreen] bounds];
       
    UIButton* buttonAlert = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonAlert setTitle:@"Test警告框" forState:UIControlStateNormal];
    CGFloat width = 100;
    CGFloat height = 30;
    CGFloat top = 130;
    buttonAlert.frame = CGRectMake((screen.size.width - width)/2, top, width, height);
    [buttonAlert addTarget:self action:@selector(testAlertView:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonActionSheet = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonActionSheet setTitle:@"Test操作表" forState:UIControlStateNormal];
    CGFloat w = 100;
    CGFloat h = 30;
    CGFloat t = 260;
    buttonActionSheet.frame = CGRectMake((screen.size.width - w)/2, t, width, h);
    [buttonActionSheet addTarget:self action:@selector(testActionSheet:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonAlert];
    [self.view addSubview:buttonActionSheet];
}

//添加警告框
- (void)testAlertView:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"你爱我吗？" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"不爱" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"Tap No Button");
    }];
    
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"❤️"  style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSLog(@"Tap Yes Button");
    }];
    
    [alertController addAction:noAction];
    [alertController addAction:yesAction];
    
    [self presentViewController:alertController animated:true completion:nil];
}

//添加操作表（三个及以上选项）
- (void)testActionSheet:(id)sender {
    UIAlertController *asController = [[UIAlertController alloc] init];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        NSLog(@"取消tab");
    }];
    UIAlertAction *destructAction = [UIAlertAction actionWithTitle:@"破坏性按钮" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"破坏性tab");
    }];
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"其他" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"其他tab");
    }];
    
    [asController addAction:cancelAction];
    [asController addAction:destructAction];
    [asController addAction:otherAction];
    //为iPad设备浮动层设置锚点？
    asController.popoverPresentationController.sourceView = sender;
    //显示
    [self presentViewController:asController animated:true completion:nil];
    
}

#pragma mark - 添加活动指示器和进度条
- (void)addIndicatorViewAndProgressView
{
    self.view.backgroundColor = [UIColor blackColor];
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    //1.获得指示器
    self.actyIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect frame = self.actyIndicatorView.frame;
    frame.origin = CGPointMake((screen.size.width - frame.size.width)/2, 84);
    self.actyIndicatorView.frame = frame;
    
    self.actyIndicatorView.hidesWhenStopped = false;
    [self.view addSubview:self.actyIndicatorView];
    
    //2.Upload按钮
    UIButton *buttonUpload = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonUpload setTitle:@"开始爱我" forState:UIControlStateNormal];
    CGFloat bw = 100;
    CGFloat bh = 30;
    CGFloat btop = 190;
    buttonUpload.frame = CGRectMake((screen.size.width - bw)/2, btop, bw, bh);
    [buttonUpload addTarget:self action:@selector(controlMove:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonUpload];
    
    //3.进度条
    CGFloat pw = 200;
    CGFloat ph = 2;
    CGFloat ptop = 283;
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake((screen.size.width - pw)/2, ptop, pw, ph)];
    [self.view addSubview:self.progressView];
    
    //4.Download按钮
    UIButton *buttonDownload = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonDownload setTitle:@"开始爱我" forState:UIControlStateNormal];
    buttonDownload.frame = CGRectMake((screen.size.width - 100)/2, 384, 100, 30);
    [buttonDownload addTarget:self action:@selector(downloadProgress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonDownload];
}

- (void)controlMove:(id)sender
{
    UIButton *button = sender;
    if([self.actyIndicatorView isAnimating]) {
        [self.actyIndicatorView stopAnimating];
        [button setTitle:@"继续爱我" forState:UIControlStateNormal];
    } else {
        [self.actyIndicatorView startAnimating];
        [button setTitle:@"停止爱我" forState:UIControlStateNormal];
    }
}

- (void)downloadProgress:(id)sender
{
    self.progressView.progress = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(download) userInfo:nil repeats:true];
}

- (void)download
{
    self.progressView.progress += 0.2;
    if(self.progressView.progress == 1.0) {
        [self.timer invalidate];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"爱我完毕" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:true completion:nil];
    }
}

@end
