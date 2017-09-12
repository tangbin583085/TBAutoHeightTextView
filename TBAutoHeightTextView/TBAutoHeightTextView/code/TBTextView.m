//
//  TBTextView.m
//  com.pintu.aaaaaa
//
//  Created by hanchuangkeji on 2017/9/4.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import "TBTextView.h"
#import "UIView+FOFExtension.h"

@interface TBTextView ()

/**
 * 一行文字的高度
 */
@property (nonatomic, weak)UITextView *placeHolder;

/**
 * 初始化的高度
 */
@property (nonatomic, assign)CGFloat initHeight;

/**
 * 最大的高度
 */
@property (nonatomic, assign)CGFloat maxHeight;

@end


@implementation TBTextView

- (UITextView *)placeHolder {
    if (_placeHolder == nil) {
        
        // 为什么用 UITextView 作占位符而不用UILabel，是因为UITextView与本身文字可以重叠一致    UITextView的上下有textContainerInset
        UITextView *placeHolder = [[UITextView alloc] init];
        _placeHolder = placeHolder;
        placeHolder.userInteractionEnabled = NO;
        placeHolder.showsVerticalScrollIndicator = NO;
        placeHolder.showsHorizontalScrollIndicator = NO;
        placeHolder.scrollEnabled = NO;
        placeHolder.font = self.font;
        placeHolder.backgroundColor= [UIColor clearColor];
        placeHolder.textColor = [UIColor lightGrayColor];
        [self addSubview:placeHolder];
    }
    return _placeHolder;
}

- (void)setPlaceHolderColor:(UIColor *)placeHolderColor {
    _placeHolderColor = placeHolderColor;
    self.placeHolder.textColor = placeHolderColor;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.placeHolder.frame = self.bounds;
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    self.placeHolder.font = font;
    _maxHeight = _maxLine * self.font.lineHeight + self.textContainerInset.top
    + self.textContainerInset.bottom;
}

- (void)setPlaceHolderString:(NSString *)placeHolderString {
    _placeHolderString = placeHolderString;
    self.placeHolder.text = placeHolderString;
    
    // 解决光标首次进入的时候占位符会滚动
    self.scrollEnabled = NO;
}

- (instancetype)init {
    if (self = [super init]) {
        // 添加文本变化通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangeText:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}


- (void)setMaxLine:(NSInteger)maxLine {
    _maxLine = maxLine;
    self.scrollEnabled = NO;
    NSLog(@"%@", self.font);
    NSLog(@"%f", self.font.lineHeight);
    CGFloat lineHeight = self.font.lineHeight? self.font.lineHeight : [UIFont systemFontOfSize:12].lineHeight;
    _maxHeight = maxLine * lineHeight + self.textContainerInset.top
    + self.textContainerInset.bottom;
}

- (void)didChangeText:(NSNotification *)notification{
    
    // 隐藏显示占位符
    self.scrollEnabled = self.placeHolder.hidden = self.hasText;
    
    // 以防监听到非自己的文本变化
    TBTextView *textView = notification.object;
    if (textView == nil || textView != self || !self.tbDelegate || ![self.tbDelegate respondsToSelector:@selector(changeHeight:textString:textView:)]) return;

    // 计算宽高
    CGFloat height = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width - 10, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.font} context:nil].size.height + 0.5;// 加0.5以防显示不全 -10是因为输入框左右有边距

    // 记录初始化高度
    static BOOL firstTimeIn = YES;
    if (firstTimeIn) {
        firstTimeIn = NO;
        _initHeight = self.bounds.size.height;
    }
    
    // 为什么取整？  因为有晃动的情况出现
    NSInteger heigtInt = ceil(height);
    CGFloat curHeight = heigtInt + self.textContainerInset.top + self.textContainerInset.bottom;
    
    // 当前高度比原始高度小
    if (_initHeight > curHeight) {
        curHeight = _initHeight;
    }
    
    // 不能超过最大高度
    if (_maxLine > 0 && curHeight > _maxHeight ) {
        curHeight = _maxHeight;
        self.scrollEnabled = YES;
    }else{
        self.scrollEnabled = NO;
    }
    
    // 执行代理
    if ([self.tbDelegate respondsToSelector:@selector(changeHeight:textString:textView:)]) {
        [self.tbDelegate changeHeight:curHeight textString:textView.text textView:textView];
    }
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
