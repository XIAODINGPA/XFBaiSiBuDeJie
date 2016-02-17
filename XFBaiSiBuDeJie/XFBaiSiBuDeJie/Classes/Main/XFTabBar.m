//
//  XFTabBar.m
//  XFBaiSiBuDeJie
//
//  Created by 谢飞 on 16/2/17.
//  Copyright © 2016年 谢飞. All rights reserved.
//

#import "XFTabBar.h"

@interface XFTabBar ()
@property (nonatomic,strong) UIButton *publishBtn;
@end
@implementation XFTabBar

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        UIButton *publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        publishBtn.size = publishBtn.currentBackgroundImage.size;
        self.publishBtn = publishBtn;
        [self addSubview:_publishBtn];
        
    }
    return self;
}

//重新设置按钮的位置
-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat width = self.width;
    CGFloat height = self.height;
    NSInteger index = 0;
    CGFloat btnW = width / 5;
    CGFloat btnH = height;
    CGFloat btnY = 0;
    
    //发布按钮位置
    self.publishBtn.center = CGPointMake(width/2, height/2);
    //遍历取出按钮
    for (UIView *view in self.subviews) {
        if (![view isKindOfClass:[UIControl class]] || view == self.publishBtn) continue; {
            
            CGFloat btnX = (index > 1 ? (index +1) : index) *btnW;
            
            view.frame = CGRectMake(btnX, btnY, btnW, btnH);
            
            index++;
        }
    }
      
}

@end
