//
//  UILabel+StringFrame.m
//  RunloopTest
//
//  Created by liqi on 16/8/31.
//  Copyright © 2016年 liqi. All rights reserved.
//

#import "UILabel+StringFrame.h"
#define UISCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
@implementation UILabel (StringFrame)

- (CGSize)sizeWithText:(NSString *)text andFont:(UIFont *)font andMaxSize:(CGSize)maxSize
{
    
    NSDictionary *atts = @{NSFontAttributeName : font};
    
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:atts context:nil].size;
}
/*
   lineSpacing  行间距
   width 指UILabel的宽度
 */
- (CGSize)multipleLinesSizeWithLineSpacing:(CGFloat)lineSpacing andText:(NSString *)text andTextWidth:(CGFloat)width{
    self.numberOfLines = 0;
    CGFloat oneRowHeight = [text sizeWithAttributes:@{NSFontAttributeName:self.font}].height;
    CGSize textSize = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentJustified;
    [paragraphStyle setLineSpacing:lineSpacing];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    
    CGFloat rows = textSize.height / oneRowHeight;//rows 是label有几行
    CGFloat realHeight = oneRowHeight;
    if (rows > 1) {            //当只有一行的时候,label的位置会被间距给占
        realHeight = (rows * oneRowHeight) + (rows - 1) * lineSpacing;
    }else if(rows <= 1){
        realHeight = oneRowHeight+lineSpacing;
    }
    [self setAttributedText:attributedString1];
    return CGSizeMake(textSize.width, realHeight);
}

@end
