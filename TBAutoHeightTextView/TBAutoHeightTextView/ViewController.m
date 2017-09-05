//
//  ViewController.m
//  TBAutoHeightTextView
//
//  Created by hanchuangkeji on 2017/9/5.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import "ViewController.h"
#import "TBTextView.h"
#import "UIView+FOFExtension.h"

@interface ViewController ()<TBTextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self demo1];
    
    [self demo2];
    
    [self demo3];
    
    [self demo4];

}


/**
 默认状态使用，和原生UITextView无差别
 */
- (void)demo1 {
    TBTextView *textView = [[TBTextView alloc] init];
    textView.frame = CGRectMake(20, 50, 100, 30);
    textView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    [self.view addSubview:textView];
}

/**
 带有占位符
 */
- (void)demo2 {
    TBTextView *textView = [[TBTextView alloc] init];
    textView.placeHolderString = @"我是TB";
    textView.placeHolderColor = [UIColor grayColor];
    textView.frame = CGRectMake(20, 80 + 50, 100, 30);
    textView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
    [self.view addSubview:textView];
}

/**
 带有占位符,且自动增高
 */
- (void)demo3 {
    TBTextView *textView = [[TBTextView alloc] init];
    textView.placeHolderString = @"我是TB";
    textView.placeHolderColor = [UIColor grayColor];
    textView.frame = CGRectMake(20, 80 + 50 + 30 + 50, 100, 30);
    textView.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    textView.tbDelegate = self;
    textView.tag = 3;
    [self.view addSubview:textView];
}

/**
 带有占位符,自动增高,最多行数为3高度
 */
- (void)demo4 {
    TBTextView *textView = [[TBTextView alloc] init];
    textView.placeHolderString = @"我是TB";
    textView.placeHolderColor = [UIColor grayColor];
    textView.frame = CGRectMake(20, 80 + 50 + 30 + 50 + 80, 100, 30);
    textView.backgroundColor = [UIColor colorWithWhite:0.6 alpha:1.0];
    textView.tbDelegate = self;
    textView.maxLine = 3;
    textView.tag = 4;
    [self.view addSubview:textView];
}

- (void)changeHeight:(CGFloat)height textString:(NSString *)text textView:(UITextView *)textView {
    TBTextView *tbtextView = (TBTextView *)[self.view viewWithTag:4];
    tbtextView.height = height;
}


@end
