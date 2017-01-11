//
//  RingHeap.h
//  Rings
//
//  Created by Fu on 2016/12/20.
//  Copyright © 2016年 Fu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ring.h"
#import "AnchorPoint.h"

@interface RingHeap : NSObject

@property (nonatomic, strong) NSArray *ringArr;

-(instancetype)initRandomHeap;
-(RingHeap *)addHeap:(RingHeap *)otherHeap;

@end
