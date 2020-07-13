//
//  TestKVC.m
//  test
//
//  Created by Bytedance on 2020/7/3.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "TestKVC.h"

static TestKVC *singleIntance;

@interface TestKVC()

@property(nonatomic, copy)NSString *country;
@property(nonatomic, copy)NSString *province;

@end

@implementation TestKVC

+ (TestKVC *)shareIntance
{
    if(!singleIntance) {
        singleIntance = [[TestKVC alloc] init];
    }
    return singleIntance;
}

- (void)testModelToDictionary
{
    self.country = @"China";
    self.province = @"Guangdong";
    NSArray *arry = @[@"country", @"province"];
    NSDictionary *dic = [self dictionaryWithValuesForKeys:arry];
    NSLog(@"%@", dic);
    NSLog(@"country is %@", [self valueForKey:@"country"]);
}

- (void)testDeepMesPass
{
    NSArray *arry = @[@"chinese", @"fuck", @"japanse"];
    NSLog(@"%@", arry);
    
    NSArray *Arry = [arry valueForKey:@"capitalizedString"];
    NSLog(@"%@", Arry);
    
    NSArray *ArryLength = [Arry valueForKeyPath: @"capitalizedString.length"];
    NSLog(@"%@", ArryLength);
}

@end
