//
//  RingHeapView.h
//  Rings
//
//  Created by Fu on 2016/12/23.
//  Copyright © 2016年 Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RingHeap.h"
#import "DeckView.h"

@interface RingHeapView : UIView

@property (nonatomic, strong) RingHeap *rHeap;
@property (nonatomic, strong) UIImageView *showRings;
@property (nonatomic, assign) CGPoint pt; // 锚点
@property (nonatomic, strong) DeckView *deckV;

-(instancetype)initWithRingHeap:(RingHeap *)rHeap;
-(instancetype)initWithRandomRingHeap;

@end
