//
//  RingHeap.m
//  Rings
//
//  Created by Fu on 2016/12/20.
//  Copyright © 2016年 Fu. All rights reserved.
//

#import "RingHeap.h"

@implementation RingHeap

-(NSArray *)ringArr{
    if (!_ringArr) {
        _ringArr = [NSArray array];
    }
    return _ringArr;
}


// 生成一个随机的环堆
-(instancetype)initRandomHeap{
    self = [super init];
    if (self) {
        self.ringArr = [[self randomSequence:3 Max:7] mutableCopy];//3层7种颜色
    }
    return self;
}

// 环堆相互之间的叠加(不同高度的环也可以叠加，游戏拓展用)
-(RingHeap *)addHeap:(RingHeap *)otherHeap{
    RingHeap *newHeap = [[RingHeap alloc] init];
    
    // 确定两个环堆的高度
    RingHeap *longHeap, *shortHeap;
    if (self.ringArr.count >= otherHeap.ringArr.count) {
        longHeap = self;
        shortHeap = otherHeap;
    }else{
        longHeap = otherHeap;
        shortHeap = self;
    }
    
    NSMutableArray *seq = [NSMutableArray arrayWithCapacity:longHeap.ringArr.count];
    for (int i=0; i<longHeap.ringArr.count; i++) {
        if (i < shortHeap.ringArr.count) {
            if (![shortHeap.ringArr[i] isEqual:@(0)] && ![longHeap.ringArr[i] isEqual:@(0)]) {
                // 叠加失败
                return nil;
            }else if([shortHeap.ringArr[i] isEqual:@(0)]){
                seq[i] = longHeap.ringArr[i];
            }else{
                seq[i] = shortHeap.ringArr[i];
            }
        }else{
            seq[i] = longHeap.ringArr[i];
        }
    }
    
    newHeap.ringArr = [seq mutableCopy];
    return newHeap;
}

// 环堆消除特定颜色的环
-(RingHeap *)minusRing:(Ring *)ring{
    RingHeap *h;
    return h;
}

// 环堆数组消除同一颜色
-(NSArray *)clearSameColor:(NSArray *)heapArr{
    NSArray *arr;
    return arr;
}

// 获取一组自然数数列，最大数为m，一定有0，可重复
-(NSMutableArray *)randomSequence:(NSUInteger)count Max:(NSUInteger)max{
    NSMutableArray *seq = [NSMutableArray arrayWithCapacity:count];
    // 先随机有几个零，确定其他随机数
    int m = arc4random() % (count-1) + 1;
    for (int i=0; i< count; i++) {
        if (i < m) {
            seq[i] = @(0);
        }else{
            seq[i] = @(arc4random() % max + 1);
        }
    }
//    NSLog(@"%@",seq);
    // 再打乱次序
    for (int i=0; i < count-1; i++) {
        int n=arc4random() % (count-i) + i;
        [seq exchangeObjectAtIndex:i withObjectAtIndex:n];
//        NSLog(@"change num%d = %@ and num%d = %@",i,seq[i],n,seq[n]);
    }
    
    return seq;
}

@end
