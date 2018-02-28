//
//  UIImageView+MMAdd.m
//  MMKitDemo
//
//  Created by xueMingLuan on 2018/2/28.
//  Copyright © 2018年 mille. All rights reserved.
//

#import "UIImageView+MMAdd.h"

@implementation UIImageView (MMAdd)

+ (UIImageView *)imageViewWithImageName:(NSString *)iconName
                              superView:(UIView *)superView
                             constraint:(void (^)(MASConstraintMaker *))constraint
                          configHandler:(void (^)(UIImageView *))configHandler
{
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:iconName];
    [superView addSubview:imageView];
    [imageView mas_makeConstraints:constraint];
    
    if (configHandler) {
        configHandler(imageView);
    }
    
    return imageView;
}

@end
