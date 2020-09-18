//
//  Thingie.h
//  firstApp
//
//  Created by Bytedance on 2020/5/11.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

//@protocol NSCoding
//
//- (void) encodeWithCoder: (NSString *) acoder;
//- (id) initWithCoder: (NSString *) aDecoder;
//
//@end

@interface Thingie : NSObject<NSCoding>
{
    NSString *name;
    int magicNumber;
    float shoeSize;
    NSMutableArray *subThingies;
}
@property (copy) NSString *name;
@property int magicNumber;
@property float shoeSize;
@property (retain) NSMutableArray *subThingies;

- (id)initWithName : (NSString *) n
       magicNumber : (int) mn
          shoeSize : (float) ss;

@end

NS_ASSUME_NONNULL_END
