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
@property(nonatomic, strong)UIImageView *ballView;
@property(nonatomic, strong)UIButton *animateButton;
@property(nonatomic, strong)CALayer *ballLayer;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self viewAnimation];
    
    //[self caAnimation];
    
    [self changeAnimationLayer];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
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
    
    self.animateButton = [[UIButton alloc] initWithFrame:CGRectMake((screen.size.width - 100)/2, 200, 100, 40)];
    [self.animateButton addTarget:self action:@selector(onCAAnimateButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.animateButton setTitle:@"Animate" forState:UIControlStateNormal];
    [self.view addSubview:self.animateButton];
    
}

- (void)onCAAnimateButtonClicked:(id)sender
{
    CGAffineTransform moveTransform = CGAffineTransformMakeTranslation(200, 300);
    self.ballView.layer.affineTransform = moveTransform;
    self.ballView.layer.opacity = 1.0;
}

#pragma mark - 改变图层
- (void)changeAnimationLayer
{
    CGRect screen = [[UIScreen mainScreen] bounds];
    self.ballView = [[UIImageView alloc] initWithFrame:CGRectMake((screen.size.width - 80)/2, 50, 80, 80)];
    self.ballView.image = [UIImage imageNamed:@"ball"];
    [self.view addSubview:self.ballView];
    
    self.animateButton = [[UIButton alloc] initWithFrame:CGRectMake((screen.size.width - 100)/2, 300, 100, 40)];
    [self.animateButton addTarget:self action:@selector(onChangeLayerButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.animateButton setTitle:@"Animate" forState:UIControlStateNormal];
    [self.view addSubview:self.animateButton];
}

- (void)onChangeLayerButtonClicked:(id)sender
{
    CGRect screen = [[UIScreen mainScreen] bounds];
    self.ballLayer = [CALayer layer];
    UIImage *image = [UIImage imageNamed:@"ball_color"];
    self.ballLayer.contents = (__bridge id)(image.CGImage);
    self.ballLayer.contentsGravity = kCAGravityResizeAspect;
    self.ballLayer.bounds = CGRectMake(0, 0, 125, 125);
    self.ballLayer.position = CGPointMake((screen.size.width)/2, 550);
    NSLog(@"异步布局开始");
    dispatch_async(dispatch_get_global_queue(0, 0), ^(){
        [self.view.layer addSublayer:self.ballLayer];
    });
    
}

@end
