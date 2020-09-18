//
//  Thingie.m
//  firstApp
//
//  Created by Bytedance on 2020/5/11.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "Thingie.h"

@implementation Thingie

@synthesize name;
@synthesize magicNumber;
@synthesize shoeSize;
@synthesize subThingies;

- (id)initWithName : (NSString *) n
       magicNumber : (int) mn
          shoeSize : (float) ss
{
    if(self = [super init]) {
        self.name = n;
        self.magicNumber = mn;
        self.shoeSize = ss;
        self.subThingies = [NSMutableArray array];
    }
    return (self);
}

- (void) dealloc
{
}

- (void) encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject: name forKey: @"name"];
    [coder encodeInt: magicNumber forKey: @"magicNumber"];
    [coder encodeFloat: shoeSize forKey: @"shoeSize"];
    [coder encodeObject: subThingies forKey: @"subThingies"];
}

- (id) initWithCoder:(NSCoder *)decoder {
    if(self = [super init]) {
        self.name = [decoder decodeObjectForKey:@"name"];
        self.magicNumber = [decoder decodeIntForKey: @"magicNumber"];
        self.shoeSize = [decoder decodeFloatForKey: @"shoeSize"];
        self.subThingies = [decoder decodeObjectForKey: @"subThingies"];
    }
    return self;
}

- (NSString *)description {
    NSString *description = [NSString stringWithFormat: @"%@: %d/%.1f %@",name, magicNumber, shoeSize, subThingies];
    return (description);
}

@end
