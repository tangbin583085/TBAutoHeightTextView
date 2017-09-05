//
//  TBTextView.h
//  com.pintu.aaaaaa
//
//  Created by hanchuangkeji on 2017/9/4.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TBTextViewDelegate <NSObject>


@optional
/**
 * 高度随着字符串数量增加
 */
- (void)changeHeight:(CGFloat)height textString:(NSString *)text textView:(UITextView *)textView;



@end



@interface TBTextView : UITextView

@property (nonatomic, weak)id<TBTextViewDelegate> tbDelegate;


/**
 * 占位符的字符串
 */
@property (nonatomic, copy)NSString *placeHolderString;

/**
 * 占位符的颜色
 */
@property (nonatomic, strong)UIColor *placeHolderColor;

/**
 * 最大行数 默认为自动无限增
 */
@property (nonatomic, assign)NSInteger maxLine;


@end
