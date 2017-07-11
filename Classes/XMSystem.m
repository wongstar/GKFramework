//
//  XMSystem.m
//  MyBaby
//
//  Created by roy on 14/11/5.
//  Copyright (c) 2014年 MyBaby. All rights reserved.
//

#import "XMSystem.h"
#import "MBProgressHUD.h"
#import "XMChannel.h"
#import "XMButton.h"
//#import "XMSettings.h"
//#import <ShareSDK/ShareSDK.h>
#import "AppDelegate.h"
#import "XMNavigationController.h"
#import "XMUIConfig.h"
#import "JCLoginViewController.h"
#import "MobClick.h"
//#import "UMFeedback.h"

@implementation XMSystem

+ (BOOL)iOS7OrLater
{
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0;
}

+ (BOOL)iOS8OrLater
{
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0;
}


+ (UIImage *)getRoundImage:(UIImage *)image withSize:(CGSize)size
{
    if (nil == image) {
        return nil;
    }
    
    CGSize newSize = CGSizeMake(size.width * image.scale, size.height * image.scale);
    UIImage *finalImage = nil;
    UIGraphicsBeginImageContext(newSize);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGAffineTransform trnsfrm = CGAffineTransformConcat(CGAffineTransformIdentity, CGAffineTransformMakeScale(1.0, -1.0));
    trnsfrm = CGAffineTransformConcat(trnsfrm, CGAffineTransformMakeTranslation(0.0, newSize.height));
    CGContextConcatCTM(ctx, trnsfrm);
    CGContextBeginPath(ctx);
    
    CGFloat margin = 0;
    CGRect rect = CGRectMake(margin, margin, newSize.width-margin*2, newSize.height-margin*2);
    CGContextAddEllipseInRect(ctx, rect);
    CGContextClip(ctx);
    CGContextDrawImage(ctx, rect, image.CGImage);
    
    finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return finalImage;
}



+ (void)showInfoMessage:(NSString *)message
{
    [XMSystem showInfoMessage:message inView:nil hideAfterDelay:1];
}

+ (void)showInfoMessage:(NSString *)message hideAfterDelay:(NSTimeInterval)delay
{
    [self showInfoMessage:message inView:nil hideAfterDelay:delay];
}

+ (void)showInfoMessage:(NSString *)message inView:(UIView *)view
{
    [self showInfoMessage:message inView:view hideAfterDelay:1];
}

+ (void)showInfoMessage:(NSString *)message inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay
{
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    hud.mode = MBProgressHUDModeText;
    [hud hide:YES afterDelay:delay];
}


+ (BOOL)is568Screen
{
    NSInteger h  =  (NSInteger) [UIScreen mainScreen].bounds.size.height;
    
    return h == 568;
}

+ (BOOL)isIPhone6Screen
{
    NSInteger h  =  (NSInteger) [UIScreen mainScreen].bounds.size.height;
    
    return (h == 667 && 2.==[UIScreen mainScreen].scale);
}

+ (BOOL)isIPhone6PlusScreen
{
    NSInteger h  =  (NSInteger) [UIScreen mainScreen].bounds.size.height;
    return (h == 736);
}

+ (BOOL)isIPhone6PlusScaleMode
{
    NSInteger h  =  (NSInteger) [UIScreen mainScreen].bounds.size.height;
    
    BOOL plusExpander = (h==667 && 3.==[UIScreen mainScreen].scale);
    
    return plusExpander;
}

#pragma mark - App Info

+ (NSString *)bundleReleaseVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+ (NSString *)bundleBuildVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

+ (NSString *)productName
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}


+ (NSUInteger *)freeDiskSpaceMB
{
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return ([[fattributes objectForKey:NSFileSystemFreeSize] unsignedIntegerValue] / 1024 / 1024);
}


#pragma mark - Analysis

+ (void)startAnalysis
{
    [XMSystem sessionStartedWithChannelId:kChannelId];
}

+ (void)sessionStartedWithChannelId:(NSString *)channelId
{
    [MobClick startWithAppkey:kUmengAppKey reportPolicy:BATCH channelId:channelId];
    [MobClick setAppVersion:[NSString stringWithFormat:@"%@.%@", [XMSystem bundleReleaseVersion], [XMSystem bundleBuildVersion]]];
}

//+ (void)trackPageBegin:(NSString *)pageName
//{
//    [MobClick beginLogPageView:pageName];
//}
//
//+ (void)trackPageEnd:(NSString *)pageName
//{
//    [MobClick endLogPageView:pageName];
//}
//
//+ (void)trackEvent:(NSString *)eventId
//{
//    [MobClick event:eventId];
//}

// find . -name "*.m" | xargs grep "trackEvent" | grep -o "trackEvent:\S*" | grep -o "\"\S*\"" | uniq | awk '{print $0 "," $0  "," 0}' | sed 's/\"//g' > "log.txt"

//+ (void)trackEvent:(NSString *)eventId label:(NSString *)eventLabel
//{
//    [MobClick event:eventId label:eventLabel];
//}
//

+ (void)viewController:(UIViewController *)ctrl addBackButtonWithBackBlock:(void (^)(id sender))back
{
    XMButton *backBtn = [XMButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"navi_back"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(0, 0, 30, 44);
    [backBtn handleTouchUpInsideWithBlock:back];
    UIBarButtonItem *backbar = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    ctrl.navigationItem.leftBarButtonItem = backbar;
}

+ (NSString *)stringFromBirthday:(NSTimeInterval)seconds withFormat:(StringBirthdayFormat)format
{
    NSDate *now = [NSDate date];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:seconds];
    NSInteger secs = (NSInteger) ([now timeIntervalSince1970] - seconds);
    
    NSString *str = nil;
    
    switch (format) {
        case kStringBirthdayFormatDefault:
        {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            str = [dateFormatter stringFromDate:date];

        }
            break;
        case kStringBirthdayFormatReadable:
        {
            if (secs < 0) {
                
                NSCalendar *gregorian = [NSCalendar currentCalendar];
                unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
                NSDateComponents *comps = [gregorian components:unitFlags fromDate:now toDate:date options:0];
                int days = [comps day];
                int years = [comps year];
                int moths = [comps month];
                
                NSMutableString *str = [NSMutableString string];
                if (years > 0) {
                    [str appendFormat:@"预产期%d年后",years];
                }
                else if (moths>0) {
                    [str appendFormat:@"预产期%d个月后",moths];
                }
                else if (days>0) {
                    [str appendFormat:@"预产期%d天后",moths];
                }
                else if (str.length==0) {
                    [str appendFormat:@"刚出生"];
                }
                return str;
            }
            else {
                
                NSCalendar *gregorian = [NSCalendar currentCalendar];
                unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay ;
                NSDateComponents *comps = [gregorian components:unitFlags fromDate:date toDate:now options:0];
                int days = [comps day];
                int years = [comps year];
                int moths = [comps month];
                
                NSMutableString *str = [NSMutableString string];
                if (years > 0) {
                    [str appendFormat:@"%d岁",years];
                }
                if (moths>0) {
                    [str appendFormat:@"%d个月",moths];
                }
                if (days>0) {
                    if (years==0&&moths==0) {
                        [str appendFormat:@"%d天",days];
                    }
                }
                if (str.length==0) {
                    [str appendFormat:@"刚出生"];
                }
                return str;
            }
            
        }
            break;
        case kStringBirthdayFormatTimeBefore:
        {
            NSCalendar *gregorian = [NSCalendar currentCalendar];
            unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
            NSDateComponents *comps = [gregorian components:unitFlags fromDate:date toDate:now options:0];
            int days = [comps day];
            int years = [comps year];
            int moths = [comps month];
            int hour = [comps hour];
            int minite = [comps minute];
            
            if (years > 0) {
                return [NSString stringWithFormat:@"%d年前",years];
            }
            else if (moths>0) {
                return [NSString stringWithFormat:@"%d个月前",moths];
            }
            else if (days>0) {
                return [NSString stringWithFormat:@"%d天前",days];
            }
            else if (hour>0) {
                return [NSString stringWithFormat:@"%d小时前",hour];
            }
            else if (minite>0) {
                return [NSString stringWithFormat:@"%d小时前",minite];
            }
            else {
                return LSTR(@"刚刚");
            }

        }
            break;
        default:
            break;
    }
    
    return str;
}

//+ (void)clearOnLogout
//{
//    [[XMSettings sharedSettings] deleteUserInfo];
//    if ([ShareSDK hasAuthorizedWithType:ShareTypeSinaWeibo]) {
//        [ShareSDK cancelAuthWithType:ShareTypeSinaWeibo];
//    }
//    
//    if ([ShareSDK hasAuthorizedWithType:ShareTypeQQSpace]) {
//        [ShareSDK cancelAuthWithType:ShareTypeQQSpace];
//    }
//}

//+ (void)onLoginSuccessWithLoginType:(NSInteger)type;
//{
//    if ([XMSystem needAddBabyOnLoginSuccess])
//    {
//        [self presentBabyInitViewControllerFrom:nil withRegiterType:type];
//    }
//    else{
//        [self showMainFrameOnLoginSuccess];
//    }
//}

+ (void)showMainFrameOnLoginSuccess
{
    
}

+ (void)showMainFrameOnRegistSuccess
{
    
}

//+ (void)logoutFrom:(UIViewController *)viewController
//{
//    if (viewController) {
//        // notify server
//    }
//    
//    // reset all views
//    [XMSystem clearOnLogout];
////    [XMSystem transitionToLogout];
//    [self presentSignViewControllerFrom:viewController];
//}

+ (void)presentSignViewControllerFrom:(id)sender
{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    JCLoginViewController *ctrl = [[JCLoginViewController alloc] init];
    XMNavigationController *naviCtrl = [[XMNavigationController alloc] initWithRootViewController:ctrl];
    [delegate.window.rootViewController presentViewController:naviCtrl animated:YES completion:NULL];
}
//
//+ (void)presentBabyInitViewControllerFrom:(id)sender withRegiterType:(NSInteger)type;
//{
//    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
//    XMBabyInitViewController *ctrl = [[XMBabyInitViewController alloc] init];
//    ctrl.type = type;
//    XMNavigationController *naviCtrl = [[XMNavigationController alloc] initWithRootViewController:ctrl];
//    [delegate.window.rootViewController presentViewController:naviCtrl animated:YES completion:NULL];
//}
//
//+ (BOOL)needAddBabyOnLoginSuccess
//{
//    return ![XMSettings sharedSettings].babysInfo;
//}

@end
