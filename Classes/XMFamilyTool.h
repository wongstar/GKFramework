//
//  XMFamily.h
//  MyBaby
//
//  Created by jieson on 14/12/22.
//  Copyright (c) 2014年 MyBaby. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    XMKinsfolkTypeFather = 1,
    XMKinsfolkTypeMather,
    XMKinsfolkTypeGrandpa,
    XMKinsfolkTypeGrandma,
    XMKinsfolkTypeGrandpa1, //外公
    XMKinsfolkTypeGrandma1, //外婆
    XMKinsfolkTypeOther,
} XMKinsfolkType;

typedef enum : NSUInteger {
    XMHealthStatusTypeNormal,
    XMHealthStatusTypeGreat
} XMHealthStatusType ;


static const NSString * kFamilyFather = @"爸爸";
static const NSString * kFamilyMather = @"妈妈";
static const NSString * kFamilyGrandpa = @"爷爷";
static const NSString * kFamilyGrandma = @"奶奶";
static const NSString * kFamilyGrandpa1 = @"外公";
static const NSString * kFamilyGrandma1 = @"外婆";
static const NSString * kFamilyOther = @"其他";

@interface XMFamilyTool : NSObject

+ (XMKinsfolkType)typeForRelation:(NSUInteger)relation;
+ (NSString const *)relationTitleWithRelation:(NSUInteger)relation;

@end
