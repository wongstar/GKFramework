//
//  XMUIFactory.h
//  MyBaby
//
//  Created by jieson on 14/12/30.
//  Copyright (c) 2014年 MyBaby. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XMTextField;
@interface XMUIFactory : NSObject

+ (UILabel *)zeroLable;
+ (UILabel *)zeroLableWithFontSize:(CGFloat)size;
+ (UILabel *)labelWithFrame:(CGRect)frame fontSize:(CGFloat)size;
+ (UILabel *)clearLabelWithFrame:(CGRect) frame andFontSize:(CGFloat)size;
+ (UILabel *)clearLabelWithFrame:(CGRect) frame FontSize:(CGFloat)size Color:(UIColor *)color;
+ (UILabel *)clearLabelWithFrame:(CGRect) frame BoldFontSize:(CGFloat)size Color:(UIColor *)color;

+ (UIView *)zeroView;
+ (UIView *)viewWithFrame:(CGRect)frame;
+ (UIView *)viewWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor;

+ (UIImageView *)zeroImageView;
+ (UIImageView *)zeroImageViewWithFrame:(CGRect)frame;

+ (UIButton *)zeroButton;
+ (XMTextField *)zeroTextField;
@end
