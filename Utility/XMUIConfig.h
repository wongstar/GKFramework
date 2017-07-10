//
//  XMUIConfig.h
//  MyBaby
//
//  Created by frank on 14-10-14.
//  Copyright (c) 2014年 MyBaby. All rights reserved.
//

#ifndef MyBaby_XMUIConfig_h
#define MyBaby_XMUIConfig_h

#import "XMUIDesign.h"

enum  {
    kMainTab_Feed= 0,
    kMainTab_Find,
    kMainTab_Camera = 10,
    kMainTab_Msg,
    kMainTab_Baby,
};

#define kButtonNormalSize   60

#define kImageEditorBottomItemSize   105
#define kImageEditorMaxImageSize     1242

#define LSTR(str)       NSLocalizedString(str, nil)
#define kNavigationTitleFontSize    18.

#define kCellBgImgInsetNomarl         UIEdgeInsetsMake(0, 0, 10.0, 0)
#define kCellBgImgInsetOpen           UIEdgeInsetsMake(0, 0, 0, 0)

#define MoveTo(view, x, y)          view.frame = CGRectMake(x, y, view.frame.size.width, view.frame.size.height)

#define colorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define colorFromRGBA(rgbValue,trans) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:trans]


#define kCellDescriptionFont            [UIFont systemFontOfSize:14]

#define kOnePixelsLineHeight            1/[UIScreen mainScreen].scale

#define kLoginButtonBGEdgeInsets        UIEdgeInsetsMake(4, 4, 4, 4)
#define kTextFieldHeight                44
#define KButtonHeight                   45

#define KTextGapHeight                  10
#define kButtonGapHeight                10
#define kTextButtonGapHeight            10

#define kScreenWidth                    [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define SET_NAVIGATION_TITLE(title)         SET_NAVIGATION_TITLE_WITH_LIMIT_WIDTH(title, 240)
#define SET_NAVIGATION_TITLE_WITH_LIMIT_WIDTH(title, limit)     \
                do {\
                    if (1 == self.navigationItem.titleView.tag) {\
                        for (UILabel *label in [self.navigationItem.titleView subviews]) {\
                        if ([label isKindOfClass:[UILabel class]]) {\
                            label.text = title;\
                            [label sizeToFit]; \
                            CGRect rect = label.frame;\
                            rect.size.width = MIN(label.frame.size.width, limit);\
                            label.frame = rect;\
                            CGRect rect2 = self.navigationItem.titleView.frame;\
                            if (rect.size.width<rect2.size.width) { \
                                rect.size.width = rect2.size.width; \
                                label.frame = rect; \
                            } \
                            else { \
                                rect2.size.width = rect.size.width; \
                                self.navigationItem.titleView.frame = rect2;\
                            } \
                        } \
                    } \
                } \
                else {\
                    UIView *view = [[UIView alloc] init];\
                    view.backgroundColor = [UIColor clearColor];\
                    view.tag = 1;\
                    UILabel *label = [[UILabel alloc] init]; \
                    label.backgroundColor = [UIColor clearColor]; \
                    label.textColor = [UIColor blackColor]; \
                    label.font = [UIFont boldSystemFontOfSize:kNavigationTitleFontSize]; \
                    label.text = title; \
                    label.lineBreakMode = NSLineBreakByCharWrapping;\
                    label.textAlignment = NSTextAlignmentCenter;\
                    [label sizeToFit]; \
                    [view addSubview:label];\
                    CGRect rect = label.frame;\
                    rect.size.width = MIN(label.frame.size.width, limit);\
                    label.frame = rect;\
                    view.frame = label.frame;\
                    self.navigationItem.titleView = view;\
                    }\
                } while (0)


#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define XM_TEXTSIZE(text, font) [text length] > 0 ? [text \
sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero;
#else
#define XM_TEXTSIZE(text, font) [text length] > 0 ? [text sizeWithFont:font] : CGSizeZero;
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define XM_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) \
attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero;
#else
#define XM_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
sizeWithFont:font constrainedToSize:maxSize lineBreakMode:mode] : CGSizeZero;
#endif

#endif
