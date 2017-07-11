//
//  XMSystem.h
//  MyBaby
//
//  Created by roy on 14/11/5.
//  Copyright (c) 2014年 MyBaby. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kStringBirthdayFormatDefault = 0,   //yyyy-MM-dd
    kStringBirthdayFormatReadable,      //x岁x个月,预产期
    kStringBirthdayFormatTimeBefore,    //刚刚，x分钟之前
} StringBirthdayFormat;

@interface XMSystem : NSObject

+ (BOOL)iOS7OrLater;
+ (BOOL)iOS8OrLater;

+ (UIImage *)getRoundImage:(UIImage *)image withSize:(CGSize)size;

//toast msg
+ (void)showInfoMessage:(NSString *)message;
+ (void)showInfoMessage:(NSString *)message hideAfterDelay:(NSTimeInterval)delay;
+ (void)showInfoMessage:(NSString *)message inView:(UIView *)view;
+ (void)showInfoMessage:(NSString *)message inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay;

//screen size
+ (BOOL)is568Screen;
+ (BOOL)isIPhone6Screen;
+ (BOOL)isIPhone6PlusScreen;
+ (BOOL)isIPhone6PlusScaleMode;

// App version
+ (NSString *)bundleReleaseVersion;  // release version
+ (NSString *)bundleBuildVersion;   // build version
+ (NSString *)productName;

//  Analysis
//================================================================================================================
// talkingData
// umeng
//
+ (void)startAnalysis;
+ (void)sessionStartedWithChannelId:(NSString *)channelId;

+ (NSUInteger *)freeDiskSpaceMB;
//+ (void)trackPageBegin:(NSString *)pageName;
//+ (void)trackPageEnd:(NSString *)pageName;
//
//+ (void)trackEvent:(NSString *)eventId;
//
//+ (void)trackEvent:(NSString *)eventId label:(NSString *)eventLabel;

//================================================================================================================
//

//navigation back button
+ (void)viewController:(UIViewController *)ctrl addBackButtonWithBackBlock:(void (^)(id sender))back;

//birthday string with format yyyy-MM-dd
+ (NSString *)stringFromBirthday:(NSTimeInterval)seconds withFormat:(StringBirthdayFormat)format;

//================================================================================================================
// login/out
//+ (void)clearOnLogout;
//+ (void)onLoginSuccessWithLoginType:(NSInteger)type;
+ (void)showMainFrameOnLoginSuccess;
+ (void)showMainFrameOnRegistSuccess;
//+ (void)logoutFrom:(UIViewController *)viewController;
+ (void)presentSignViewControllerFrom:(id)sender;
//+ (void)presentBabyInitViewControllerFrom:(id)sender withRegiterType:(NSInteger)type;
@end
