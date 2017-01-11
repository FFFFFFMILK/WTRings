//
//  RingHeapView.m
//  Rings
//
//  Created by Fu on 2016/12/23.
//  Copyright © 2016年 Fu. All rights reserved.
//

#import "RingHeapView.h"

@interface RingHeap()<UIGestureRecognizerDelegate>

@end

@implementation RingHeapView

-(instancetype)initWithRingHeap:(RingHeap *)rHeap{
    self = [super init];
    if (self) {
        self.rHeap = rHeap;
        [self showRingAccordingData:self.rHeap.ringArr];
    }
    return self;
}

-(instancetype)initWithRandomRingHeap{
    self = [super init];
    if (self) {
        self.rHeap = [[RingHeap alloc]initRandomHeap];
        [self showRingAccordingData:self.rHeap.ringArr];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        [self setBackgroundColor:[UIColor blackColor]];
        self.rHeap = [[RingHeap alloc]initRandomHeap];
        [self showRingAccordingData:self.rHeap.ringArr];
    }
    return self;
}

-(void)showRingAccordingData:(NSArray *)arr{
//    NSLog(@"arr is %@", arr);
    for (int i=0; i<arr.count; i++) {
        // 确定大小
        NSString *sizeName;
        switch (i) {
            case 0:
                sizeName = @"Small";
                break;
            case 1:
                sizeName = @"Middle";
                break;
            case 2:
                sizeName = @"Big";
                break;
            default:
                sizeName = @"Big";
                break;
        }
        // 确定颜色
        NSString *colorName;
        switch ([arr[i] integerValue]) {
            case 0:
                break;
            case 1:
                colorName = @"Blue";
                break;
            case 2:
                colorName = @"Cyan";
                break;
            case 3:
                colorName = @"Green";
                break;
            case 4:
                colorName = @"Orange";
                break;
            case 5:
                colorName = @"Pink";
                break;
            case 6:
                colorName = @"Purple";
                break;
            case 7:
                colorName = @"Red";
                break;
            default:
                break;
        }
        
        if ([arr[i] isEqual:@(0)]) {
            continue;
        }
        // 绘制图片
        UIImageView *imgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[sizeName stringByAppendingString:colorName]]];
        imgV.frame = CGRectMake((self.frame.size.width - 30 - 24 * i)/4, (self.frame.size.height - 30 - 24 * i)/4, 30 + 12 * i, 30 + 12 * i);
        [self addSubview:imgV];
    }
    
    // 设置锚点位置
    self.pt = self.center;
    
    [self setupGesture];
}

-(void)setupGesture{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(checkAround:)];
    [self addGestureRecognizer:pan];
}

-(void)checkAround:(UIPanGestureRecognizer *)gesture{
    // 0.随手势移动
    CGPoint pt = [gesture translationInView:self];
    gesture.view.center = CGPointMake(gesture.view.center.x + pt.x, gesture.view.center.y + pt.y);
    [gesture setTranslation:CGPointMake(0, 0) inView:self];
    
    // 1.是否为可放置地点
    CGPoint curpt = gesture.view.center;
    if(gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateCancelled){
//        NSLog(@"gesture.view.center is %f and %f", gesture.view.center.x, gesture.view.center.y);
        for (int i=0; i<9; i++) {
            AnchorPoint *ap = self.deckV.ptArr[i];
            CGPoint curAp = CGPointMake(ap.pt.x + self.deckV.frame.origin.x, ap.pt.y + self.deckV.frame.origin.y);//注意统一坐标系
            CGFloat len = sqrt((curAp.x - curpt.x)*(curAp.x - curpt.x) + (curAp.y - curpt.y)*(curAp.y - curpt.y));
            //            NSLog(@"len is %f, and ap.pt is %f and %f", len, curAp.x, curAp.y);
            if (len <= 50) {
                // 判断是否已有
                
                // 可放置
                self.center = CGPointMake(curAp.x + 17, curAp.y + 17);
                
                break;
            }else{
                self.center = self.pt; //回归锚点
            }
        }
    }
    
    // 2.是否可合并（包括不需要合并情况）
    // 3.是否可消除
    
    
}


@end
