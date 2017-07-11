//
//  XMFamily.m
//  MyBaby
//
//  Created by jieson on 14/12/22.
//  Copyright (c) 2014年 MyBaby. All rights reserved.
//

#import "XMFamilyTool.h"

@implementation XMFamilyTool

+ (XMKinsfolkType)typeForRelation:(NSUInteger)relation
{
    return relation;
}

+ (NSString const *)relationTitleWithRelation:(NSUInteger)relation
{
    if (!relation) {
        return @"关系不存在";
    }
    XMKinsfolkType type = [XMFamilyTool typeForRelation:relation];
    NSString const  *title = nil;
    switch (type) {
        case XMKinsfolkTypeFather:
            title = kFamilyFather;
            break;
        case XMKinsfolkTypeMather:
            title =kFamilyMather;
            break;
        case XMKinsfolkTypeGrandpa:
            title = kFamilyGrandpa;
            break;
        case XMKinsfolkTypeGrandma:
            title = kFamilyGrandma;
            break;
        case XMKinsfolkTypeGrandpa1:
            title = kFamilyGrandpa1;
            break;
        case XMKinsfolkTypeGrandma1:
            title = kFamilyGrandma1;
            break;
        case XMKinsfolkTypeOther:
            title = kFamilyOther;
            break;
        default:
            break;
    }
    return title;
    
}

@end
