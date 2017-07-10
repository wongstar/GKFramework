//
//  XMConfig.h
//  MyBaby
//
//  Created by frank on 14/10/26.
//  Copyright (c) 2014年 MyBaby. All rights reserved.
//

#ifndef MyBaby_XMConfig_h
#define MyBaby_XMConfig_h

// for register
#define kMinNickNameLength          2
#define kMaxNickNameLength          10

#define kMinPasswordLength          6
#define kMaxPasswordLength          16

//邮箱注册字段
extern NSString * const RegistMailAccountKey;
extern NSString * const RegistNickNameKey;
extern NSString * const RegistPasswordKey;
extern NSString * const RegistCodeKey;

extern NSString * const XMAddNewTagNotification;

#endif
