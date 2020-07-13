//
//  RegisterViewController.m
//  ModalView
//
//  Created by Bytedance on 2020/6/27.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@property (nonatomic, strong) UITextField *userNameTextField;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"注册";
    
    UIBarButtonItem *saveButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];

    UIBarButtonItem *cancelButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];

    self.navigationItem.rightBarButtonItem = saveButtonItem;
    self.navigationItem.leftBarButtonItem = cancelButtonItem;
    
    CGRect screenF = [[UIScreen mainScreen] bounds];
    UILabel *labelId = [[UILabel alloc] initWithFrame:CGRectMake(60 ,0, screenF.size.width / 3, 60)];
    labelId.text = @"用户ID";
    [labelId setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:labelId];
    
    self.userNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(60, screenF.size.width / 3, screenF.size.width / 2, 60)];
    self.userNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.userNameTextField];
}

//内存警告时会调用
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)save:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:^(){
       
        NSLog(@"点击Save按钮，关闭模态视图");
        NSDictionary *dataDict = @{@"username" : self.userNameTextField.text};
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RegisterCompletionNotification" object:nil userInfo:dataDict];
        
    }];
}

- (void)cancel:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:^(){
        NSLog(@"点击Cancel按钮，关闭模态视图");
    }];
}




@end
