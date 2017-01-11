//
//  DeckView.h
//  Rings
//
//  Created by Fu on 2016/12/28.
//  Copyright © 2016年 Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "AnchorPoint.h"

@interface DeckView : UIView

@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) NSArray *ptArr; // 九个锚点

@end
