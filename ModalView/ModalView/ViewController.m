//
//  ViewController.m
//  ModalView
//
//  Created by Bytedance on 2020/6/27.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "ViewController.h"
#import "RegisterViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    self.navigationItem.title = @"登录";
    
    UILabel *labelID = [[UILabel alloc] initWithFrame:CGRectMake(80, 115, 80, 21)];
    labelID.text = @"用户ID";
    [self.view addSubview:labelID];
    
    UITextField *textFieldId = [[UITextField alloc] initWithFrame:CGRectMake(170, 106, 100, 30)];
    textFieldId.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textFieldId];
    
    UILabel *labelPwd = [[UILabel alloc] initWithFrame:CGRectMake(80, 178 , 80, 21)];
    labelPwd.text = @"密码";
    [self.view addSubview:labelPwd];
    
    UITextField *textFieldPwd = [[UITextField alloc] initWithFrame:CGRectMake(170, 169, 100, 30)];
    textFieldPwd.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textFieldPwd];
    
    UIButton *buttonLogin = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonLogin.frame = CGRectMake((screen.size.width - 30)/2, 231, 50, 30);
    [buttonLogin setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview: buttonLogin];
    
    UIButton *buttonReg = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonReg.frame = CGRectMake((screen.size.width - 30)/2, 294, 50, 30);
    [buttonReg setTitle:@"注册" forState:UIControlStateNormal];
    [buttonReg addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonReg];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(registerCompletion:) name:@"RegisterCompletionNotification" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)onClick:(id)sender
{
    RegisterViewController *rvc = [[RegisterViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:rvc];
    [self presentViewController:nvc animated:TRUE completion:nil];
}

- (void)registerCompletion:(NSNotification *)notification
{
    NSDictionary *theData = [notification userInfo];
    NSString *username = theData[@"username"];
    NSLog(@"username = %@", username);
}


@end
