//
//  Deck.m
//  Rings
//
//  Created by Fu on 2016/12/28.
//  Copyright © 2016年 Fu. All rights reserved.
//

#import "Deck.h"

@implementation Deck

-(instancetype)init{
    self = [super init];
    if (self) {
        self.rHeapArr = [NSMutableArray arrayWithCapacity:9];
    }
    return self;
}

-(void)locateRingHeap:(RingHeap *)rHeap atIndex:(int)index{
    if (self.rHeapArr[index] == nil) {
        [self.rHeapArr setValue:rHeap forKey:@(index)];
    }else{
        [self.rHeapArr setValue:[rHeap addHeap:self.rHeapArr[index]] forKey:@(index)];
    }
}

@end
