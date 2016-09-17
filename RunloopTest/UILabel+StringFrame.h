//
//  UILabel+StringFrame.h
//  RunloopTest
//
//  Created by liqi on 16/8/31.
//  Copyright © 2016年 liqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (StringFrame)


- (CGSize)sizeWithText:(NSString *)text andFont:(UIFont *)font andMaxSize:(CGSize)maxSize;

- (CGSize)multipleLinesSizeWithLineSpacing:(CGFloat)lineSpacing andText:(NSString *)text;

@end


