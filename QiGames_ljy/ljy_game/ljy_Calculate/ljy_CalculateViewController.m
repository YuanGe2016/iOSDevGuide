//
//  ljy_CalculateViewController.m
//  ljy_game
//
//  Created by Bytedance on 2020/5/12.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "ljy_CalculateViewController.h"

@interface ljy_CalculateViewController ()

@property (weak, nonatomic) IBOutlet UILabel *factorLabel1;
@property (weak, nonatomic) IBOutlet UILabel *factorLabel2;
@property (weak, nonatomic) IBOutlet UILabel *factorLabel3;
@property (weak, nonatomic) IBOutlet UILabel *operatorLabel1;
@property (weak, nonatomic) IBOutlet UILabel *operatorLabel2;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *recordingLabel;
@property (weak, nonatomic) IBOutlet UIButton *questionButton;
@property (weak, nonatomic) IBOutlet UIButton *resultButton;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (nonatomic, strong) NSTimer *timer;

@end //类扩展

@implementation ljy_CalculateViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    [self resetElements];
    [_startButton setTitle:[_startButton titleForState: UIControlStateSelected] forState:(UIControlStateSelected | UIControlStateHighlighted)];
    
    
}

- (void) dealloc {
    
    NSLog(@"%s", __func__); //？
}

#pragma mark - Action functions

- (IBAction)questionButtonClicked :(id)sender {
    
    _questionButton.enabled = NO;
    _resultButton.enabled = YES;
    
    [self setQuestion];
}

- (IBAction)resultButtonClicked :(id)sender {
    
    _questionButton.enabled = YES;
    _resultButton.enabled = NO;
    
    _resultLabel.text = @([self calculate]).stringValue;
    
}
- (IBAction)startButtonClicked:(UIButton *)sender {
    NSString *message = [NSString stringWithFormat:@"确定要 %@ 吗？", sender.currentTitle];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle: @"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:sender.currentTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){
        
        sender.selected = !sender.selected;                     //点击确认后的代码处理块
        self.resultButton.enabled = !self.resultButton.enabled;
        
        if (sender.selected) {
            [self resetElements];
            [self startTimer];
        } else {
            [self stopTimer];
        }
    }];
    
    [alertController addAction: cancelAction];
    [alertController addAction: confirmAction];
    
    [self.navigationController presentViewController: alertController animated:YES completion:nil];
}

#pragma mark - Private functions

- (void) setQuestion {
    
    _resultLabel.text = @"";
    
    _factorLabel1.text = [self generateFactor];
    _factorLabel2.text = [self generateFactor];
    _factorLabel3.text = [self generateFactor];
    
    _operatorLabel1.text = [self generateOperator];
    _operatorLabel2.text = [self generateOperator];
}

//生成数字
- (NSString *) generateFactor {
    
    NSUInteger r = arc4random() % 10;
    NSUInteger max = r < 4? 10: r < 7? 20: r < 9? 50: 100; //甘复杂？！
    NSUInteger factor = arc4random() % max;
    
    return @(factor).stringValue;
}

//生成运算符
- (NSString *) generateOperator {
    
    NSUInteger r = arc4random() % 5;
    NSString *operator = r < 2? @"+": r < 4? @"-": @"*";
    return operator;
}

//计算方法
- (NSInteger) calculate {
    
    NSUInteger f1 = _factorLabel1.text.integerValue;
    NSUInteger f2 = _factorLabel2.text.integerValue;
    NSUInteger f3 = _factorLabel3.text.integerValue;
    
    NSString *o1 = _operatorLabel1.text;
    NSString *o2 = _operatorLabel2.text;
    
    NSInteger result = [self calculateWithOperator:o1 leftFactor:f1 rightFactor:f2];
    if([o2 isEqualToString:@"*"]) {
        result = [self calculateWithOperator:o2 leftFactor:f2 rightFactor:f3];
        result = [self calculateWithOperator:o1 leftFactor:f1 rightFactor:result];
    } else {
        result = [self calculateWithOperator:o2 leftFactor:result rightFactor:f3];
    }
    return result;
}

- (NSUInteger) calculateWithOperator:(NSString *)operator
leftFactor:(NSUInteger)leftFactor rightFactor:(NSUInteger)rightFactor {
    
    NSInteger result = leftFactor;
    if([operator isEqualToString:@"+"]) {
        result += rightFactor;
    } else if([operator isEqualToString:@"-"]) {
        result -= rightFactor;
    } else {
        result *= rightFactor;
    }
    return result;
}

- (void)resetElements {
    
    _factorLabel1.text = @"0";
    _factorLabel2.text = @"0";
    _factorLabel3.text = @"0";
    
    _operatorLabel1.text = @"+";
    _operatorLabel2.text = @"+";
    
    _questionButton.enabled = YES;
    _resultButton.enabled = YES;
}

- (void) startTimer {
    [self stopTimer];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countUp) userInfo:nil repeats:YES];
}

- (void)stopTimer {
    
    [_timer invalidate];
    _timer = nil;
}

- (void)countUp {
    
    NSInteger count = _recordingLabel.text.integerValue;
    _recordingLabel.text = @(++count).stringValue;
}


@end
