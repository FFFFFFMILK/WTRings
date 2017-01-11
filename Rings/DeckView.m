//
//  DeckView.m
//  Rings
//
//  Created by Fu on 2016/12/28.
//  Copyright © 2016年 Fu. All rights reserved.
//

#import "DeckView.h"

@implementation DeckView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    
    /*画填充圆
     */
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor blueColor] set];
    CGContextFillRect(context, rect);
    
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:9];
    // 排布九个点
    for (int i=0; i<3; i++) {
        for (int j=0; j<3; j++) {
            CGRect frame = CGRectMake(rect.size.width/6 *(1+2*i)-5, rect.size.height/6 *(1+2*j)-5, 10, 10);
            CGContextAddEllipseInRect(context, frame);
            [[UIColor whiteColor] set];
            CGContextFillPath(context);
            AnchorPoint *ap = [[AnchorPoint alloc]init];
            ap.pt = CGPointMake(rect.size.width/6 *(1+2*i), rect.size.height/6 *(1+2*j));
            [arr addObject:ap];
        }
    }
    
    self.ptArr = [arr mutableCopy];
}


@end
