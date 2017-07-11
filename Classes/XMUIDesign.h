//
//  XMUIDesign.h
//  MyBaby
//
//  Created by frank on 14/12/8.
//  Copyright (c) 2014年 MyBaby. All rights reserved.
//

#ifndef MyBaby_XMUIDesign_h
#define MyBaby_XMUIDesign_h

#define colorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// NaviBar 红色背景
#define     kNaviBarBgColor        colorFromRGB(0xdf3132)


#define     kTipTextColor       colorFromRGB(0x969696)

#define     kCommonDarkClolr       colorFromRGB(0x323232)

#define     kCommonBorderColor     colorFromRGB(0xdfdfdf)

#define     kComButtonBgColor      colorFromRGB(0xdf3132)

#define     kLineCommonColor       colorFromRGB(0xdcdcdc)

#define     kCommonBGColor         colorFromRGB(0xf0f0f0)

#define    kCommonSelectColor      colorFromRGB(0xf5f5f5)


// 黑色
#define     kTextColorLevel1       colorFromRGB(0x000000)

// 褐色
#define     kTextColorLevel2       colorFromRGB(0x9b6b6c)

// 浅褐色
#define     kTextColorLevel3       colorFromRGB(0xb79995)

#define     kTextColorLevel4       colorFromRGB(0xddbeb9)

#define     kTextColorLevel5       colorFromRGB(0xefddd7)

#define     kTextColorLevel6       colorFromRGB(0xf9f3eb)

//layout common parameter is following

#define  k_leftPadding  25.f
#define  k_rightPadding  25.f
#define  k_commonLineGap 25.f
#define  k_commonLineGap2  10.f
#define  k_buttonCommonRadius  25.f

#endif
