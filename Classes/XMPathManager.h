//
//  XMPathManager.h
//  MyBaby
//
//  Created by frank on 14/10/26.
//  Copyright (c) 2014年 MyBaby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMPathManager : NSObject

+ (NSString *)serverURL;

+ (NSString *)serverLoginURL;

+ (NSString *)picServerURL;

+ (NSString *)userInfoFilePathForUid:(NSString *)uid;
+ (NSString *)babyInfoFilePathForUid:(NSString *)uid;
+ (NSString *)carInfoFilePathForCid:(NSString *)cid;
+(NSString *)carInfosFilePathForCid:(NSString *)cid;
// 删除文件
+ (void)deleteFile:(NSString *)file;

+ (NSString *)addonPkgDirectory:(NSInteger)type;
+ (NSString *)addonPkgDirectory:(NSInteger)type packageId:(NSInteger)packageId;

@end
