//
//  XMPathManager.m
//  MyBaby
//
//  Created by frank on 14/10/26.
//  Copyright (c) 2014年 MyBaby. All rights reserved.
//

#import "XMPathManager.h"
#import "MyLogger.h"
#import "FCFileManager.h"
#import "XMNetInterfaceDef.h"

/* App
 *      /Documents
 *          /iDoc
 *              /watermark
 *              /paster
 *              /Users          /<uid>
 *                  /<uid>
 *                      /userinfo
 *                      /babyinfo
 *
 *
 *      /Library
 *
 *
 *     /tmp
 */

static NSString *kUsersDirectory = @"Users";
static NSString *kWatermarkDirectory = @"watermark";
static NSString *kPasterDirectory = @"paster";

static NSString *kUserInfoFileName = @"userinfo";
static NSString *kUserBabyInfoFileName = @"babyinfo";
static NSString *kUserCarInfoFileName = @"carinfo";
static NSString *kUserCarInfosFileName =@"carinfos";


@implementation XMPathManager

+ (NSString *)serverURL
{
    return @"http://114.215.159.219:8080/childhood/api/";
}

+ (NSString *)serverLoginURL
{
    return @"http://114.215.159.219:8080/childhood/";
}

+ (NSString *)picServerURL
{
    return kQiNiuDomain;
}

+ (NSString *)documentsDirectory
{
    return [FCFileManager pathForDocumentsDirectory];
}

+ (NSString *)iDocDirectory
{
    NSString *doc = [XMPathManager documentsDirectory];
    NSString *idocDir = [doc stringByAppendingPathComponent:@"iDoc"];
    
    [self createDirectoryAtPath:idocDir];
    return idocDir;
}

+ (NSString *)userDirectoryForUid:(NSString *)uid
{
    NSString *usersDirectory = [self usersDirectory];
    NSString *uidStr = [NSString stringWithFormat:@"%@", uid];
    
    NSString *userDirectory = [usersDirectory stringByAppendingPathComponent:uidStr];
    
    [self createDirectoryAtPath:userDirectory];
    return userDirectory;
}



+ (NSString *)usersDirectory
{
    NSString *dir = [XMPathManager iDocDirectory];
    
    NSString *usersDirectory = [dir stringByAppendingPathComponent:kUsersDirectory];
    
    [self createDirectoryAtPath:usersDirectory];
    
    return usersDirectory;
}

+ (BOOL)createDirectoryAtPath:(NSString *)path
{
    return [FCFileManager createDirectoriesForPath:path];
}

+ (NSString *)userInfoFilePathForUid:(NSString *)uid
{
    NSString *userDirectory = [XMPathManager userDirectoryForUid:uid];
    NSString *userInfoPath = [userDirectory stringByAppendingPathComponent:kUserInfoFileName];
    
    return userInfoPath;
}

+ (NSString *)babyInfoFilePathForUid:(NSString *)uid
{
    NSString *userDirectory = [XMPathManager userDirectoryForUid:nil];
    NSString *babyInfoPath = [userDirectory stringByAppendingPathComponent:kUserBabyInfoFileName];
    return babyInfoPath;
}

+ (NSString *)carInfoFilePathForCid:(NSString *)cid
{
    NSString *userDirectory = [XMPathManager userDirectoryForUid:cid];
    NSString *babyInfoPath = [userDirectory stringByAppendingPathComponent:kUserCarInfoFileName];
    return babyInfoPath;
}

+ (NSString *)carInfosFilePathForCid:(NSString *)cid
{
    NSString *userDirectory = [XMPathManager userDirectoryForUid:cid];
    NSString *babyInfoPath = [userDirectory stringByAppendingPathComponent:kUserCarInfosFileName];
    return babyInfoPath;
}


+ (void)deleteFile:(NSString *)file
{
    BOOL isDir;
    if([[NSFileManager defaultManager] fileExistsAtPath:file isDirectory:&isDir] && !isDir){
        [[NSFileManager defaultManager] removeItemAtPath:file error:nil];
    }
}

#pragma mark - addon package directory

+ (NSString *)addonPkgDirectory:(NSInteger)type
{
    NSString *dir = [XMPathManager iDocDirectory];
    
    NSString *directory = [dir stringByAppendingPathComponent:kWatermarkDirectory];
    if (1 == type) {
        directory = [dir stringByAppendingPathComponent:kPasterDirectory];
    }
    
    [self createDirectoryAtPath:directory];
    
    return directory;
}

+ (NSString *)addonPkgDirectory:(NSInteger)type packageId:(NSInteger)packageId
{
    NSString *dir = [XMPathManager addonPkgDirectory:type];
    
    NSString *directory = [dir stringByAppendingPathComponent:[NSString stringWithFormat:@"%ld", packageId]];
    
    [self createDirectoryAtPath:directory];
    
    return directory;
}

@end
