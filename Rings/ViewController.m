//
//  ViewController.m
//  Rings
//
//  Created by Fu on 2016/12/20.
//  Copyright © 2016年 Fu. All rights reserved.
//

#import "ViewController.h"
#import "RingHeapView.h"
#import "DeckView.h"

#define _window_height [[UIScreen mainScreen] bounds].size.height
#define _window_width [[UIScreen mainScreen] bounds].size.width

@interface ViewController ()

@property (nonatomic, strong) DeckView *deckV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(30, 10, 50, 30);
    [btn setTitle:@"btn" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(ShowNewRingHeaps) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.deckV = [[DeckView alloc]initWithFrame:CGRectMake(_window_width/6, _window_height/3 - 100, _window_width *2/3 , _window_width *2/3)];
    [self.view addSubview:self.deckV];
}

-(void)ShowNewRingHeaps{
    for (UIView *view in self.view.subviews) {
        if (view.tag >= 1000) {
            [view removeFromSuperview];
        }
    }
    for (int i=0; i<3; i++) {
        RingHeapView *rhView = [[RingHeapView alloc]initWithFrame:CGRectMake(_window_width/6 + (i*2 + 1)*_window_width/9 - 50 , 100 + _window_width , 100, 100)];
        rhView.tag = 1000 + i;
        [self.view addSubview:rhView];
        rhView.deckV = self.deckV;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
