//
//  UIView+FOFExtension.h
//  FOF
//
//  Created by hanchuangkeji on 2017/5/5.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FOFExtension)

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

+ (instancetype)viewFromXib;

/**
 颜色直接生成图片

 @param color <#color description#>
 @return <#return value description#>
 */
+ (UIImage *)createImageWithColor:(UIColor *)color;


+ (void) alertWithTitle:(NSString *)title msg:(NSString *)msg;

@end
