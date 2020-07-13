//
//  TestKVC.h
//  test
//
//  Created by Bytedance on 2020/7/3.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestKVC : NSObject

+ (TestKVC *) shareIntance;
- (void) testModelToDictionary;
- (void) testDeepMesPass;

@end

NS_ASSUME_NONNULL_END
