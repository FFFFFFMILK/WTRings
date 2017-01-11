//
//  Ring.m
//  Rings
//
//  Created by Fu on 2016/12/20.
//  Copyright © 2016年 Fu. All rights reserved.
//

#import "Ring.h"

@implementation Ring

-(instancetype)initWithSize:(NSString *)size andColor:(NSString *)color{
    self = [super init];
    if (self) {
        self.size = size;
        self.color = color;
    }
    return self;
}

@end
