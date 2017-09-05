//
//  UIView+FOFExtension.m
//  FOF
//
//  Created by hanchuangkeji on 2017/5/5.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import "UIView+FOFExtension.h"


@implementation UIView (FOFExtension)


- (void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size{
    return self.frame.size;
}

- (CGFloat)width{
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height{
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)x{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)y{
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)centerX{
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX{
    CGPoint centerPoint = self.center;
    centerPoint.x = centerX;
    self.center = centerPoint;
}

- (CGFloat)centerY{
    return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY{
    CGPoint centerPoint = self.center;
    centerPoint.y = centerY;
    self.center = centerPoint;
}



+ (instancetype )viewFromXib{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}


/**
 UIColor生成图片

 @param color <#color description#>
 @return <#return value description#>
 */
+ (UIImage *)createImageWithColor:(UIColor *)color
{
    //设置长宽
    CGRect rect = CGRectMake(0.0f, 0.0f, 5.0f, 5.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImage;
}


+ (void) alertWithTitle:(NSString *)title msg:(NSString *)msg {
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:msg
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"确定", nil];
    
    [alert show];
    
}

@end
