//
//  AnimationViewController.m
//  AlertViewActionSheet
//
//  Created by Bytedance on 2020/6/18.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@property(nonatomic, readwrite, assign)NSInteger ballMoveDirection;
@property(nonatomic, strong)UIImageView* ballView;
@property(nonatomic, strong)UIButton* animateButton;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self viewAnimation];
    //[self caAnimation];
}



#pragma mark - 视图动画
- (void)viewAnimation
{
    self.ballMoveDirection = 1;
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    self.ballView = [[UIImageView alloc] initWithFrame:CGRectMake((screen.size.width - 80)/2, 50, 80, 80)];
    self.ballView.image = [UIImage imageNamed:@"ball"];
    [self.view addSubview:self.ballView];
    
    self.animateButton = [[UIButton alloc] initWithFrame:CGRectMake((screen.size.width - 100)/2, 400, 100, 40)];
    [self.animateButton addTarget:self action:@selector(onAnimateButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.animateButton setTitle:@"Animate" forState:UIControlStateNormal];
    [self.view addSubview:self.animateButton];
}

- (void)onAnimateButtonClicked:(id)sender
{
    self.animateButton.alpha = 0.0;
    
    [UIView animateWithDuration:1.5 animations:^(){
        CGRect frame = self.ballView.frame;
        frame.origin.y += 200 * self.ballMoveDirection;
        self.ballMoveDirection *= -1;
        self.ballView.frame = frame;
    } completion:^(BOOL finished){
        [self animateDone];
    }];
}

- (void)animateDone
{
    [UIView animateWithDuration:1 animations:^(){
        self.animateButton.alpha = 1.0;
    }];
}

#pragma mark - CA动画
- (void)caAnimation
{
    CGRect screen = [[UIScreen mainScreen] bounds];
    self.ballView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 80, 80)];
    self.ballView.image = [UIImage imageNamed:@"ball"];
    self.ballView.layer.opacity = 0.25;
    [self.view addSubview:self.ballView];
    
    self.animateButton = [[UIButton alloc] initWithFrame:CGRectMake((screen.size.width - 100)/2, 500, 100, 40)];
    [self.animateButton addTarget:self action:@selector(caAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.animateButton setTitle:@"Animate" forState:UIControlStateNormal];
    [self.view addSubview:self.animateButton];
    
}

- (void)caAnimation:(id)sender
{
    CGAffineTransform moveTransform = CGAffineTransformMakeTranslation(200, 300);
    self.ballView.layer.affineTransform = moveTransform;
    self.ballView.layer.opacity = 1.0;
}

@end
