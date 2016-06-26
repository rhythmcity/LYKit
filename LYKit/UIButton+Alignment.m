//
//  UIButton+Alignment.m
//  LYConnection
//
//  Created by 李言 on 16/6/26.
//  Copyright © 2016年 李言. All rights reserved.
//

#import "UIButton+Alignment.h"

@implementation UIButton (Alignment)

- (void)titleImageVerticalAlignmentWithSpace:(CGFloat)space {
    [self ly_resetEdgeInsets];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGRect contentRect  = [self contentRectForBounds:self.bounds];
    CGSize titleSize    = [self titleRectForContentRect:contentRect].size;
    CGSize imageSize    = [self imageRectForContentRect:contentRect].size;
    float halfWidth     = (titleSize.width + imageSize.width) / 2;
    float halfHeight    = (titleSize.height + imageSize.height) / 2;
    float topInset      = MIN(halfHeight, titleSize.height);
    float leftInset     = (titleSize.width - imageSize.width) > 0 ? (titleSize.width - imageSize.width) / 2 : 0;
    float bottomInset   = (titleSize.height - imageSize.height) > 0 ? (titleSize.height - imageSize.height) / 2 : 0;
    float rightInset    = MIN(halfWidth, titleSize.width);
    [self setTitleEdgeInsets:UIEdgeInsetsMake(-halfHeight-space, - halfWidth, halfHeight+space, halfWidth)];
    [self setContentEdgeInsets:UIEdgeInsetsMake(topInset+space, leftInset, -bottomInset, -rightInset)];

}
- (void)imageTitleVerticalAlignmentWithSpace:(CGFloat)space {
    [self ly_resetEdgeInsets];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGRect contentRect  = [self contentRectForBounds:self.bounds];
    CGSize titleSize    = [self titleRectForContentRect:contentRect].size;
    CGSize imageSize    = [self imageRectForContentRect:contentRect].size;
    float halfWidth     = (titleSize.width + imageSize.width) / 2;
    float halfHeight    = (titleSize.height + imageSize.height) / 2;
    float topInset      = MIN(halfHeight, titleSize.height);
    float leftInset     = (titleSize.width - imageSize.width) > 0 ? (titleSize.width - imageSize.width) / 2 : 0;
    float bottomInset   = (titleSize.height - imageSize.height) > 0 ? (titleSize.height - imageSize.height) / 2 : 0;
    float rightInset    = MIN(halfWidth, titleSize.width);
    [self setTitleEdgeInsets:UIEdgeInsetsMake(halfHeight+space, - halfWidth, -halfHeight-space, halfWidth)];
    [self setContentEdgeInsets:UIEdgeInsetsMake(-bottomInset, leftInset, topInset+space, -rightInset)];


}

- (void)titleImageHorizontalAlignmentWithSpace:(CGFloat)space {
    [self ly_resetEdgeInsets];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGRect contentRect  = [self contentRectForBounds:self.bounds];
    CGSize titleSize    = [self titleRectForContentRect:contentRect].size;
    CGSize imageSize    = [self imageRectForContentRect:contentRect].size;
    [self setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, space)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageSize.width, 0, imageSize.width)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, titleSize.width + space, 0, -titleSize.width - space)];
    

}

- (void)imageTitleHorizontalAlignmentWithSpace:(CGFloat)space {
    [self ly_resetEdgeInsets];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, space, 0, -space)];
    [self setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, space)];

}

- (void)ly_resetEdgeInsets {
    [self setContentEdgeInsets:UIEdgeInsetsZero];
    [self setImageEdgeInsets:UIEdgeInsetsZero];
    [self setTitleEdgeInsets:UIEdgeInsetsZero];

}


@end
