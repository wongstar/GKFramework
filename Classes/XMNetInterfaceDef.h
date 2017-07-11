//
//  XMNetInterfaceDef.h
//  MyBaby
//
//  Created by frank on 14/10/26.
//  Copyright (c) 2014年 MyBaby. All rights reserved.
//

#ifndef MyBaby_XMNetInterfaceDef_h
#define MyBaby_XMNetInterfaceDef_h

#define API_PATH_LOGIN      @"user/login.api"

#define kRemoteConfigURL    @"configurations/get"

#define kAddressUploadURL   @"parents/%ld/mobileContacts"
#define kRegThirdParty      @"register/socialprovider"
#define kRegEmailURL        @"register"
#define kRegOauthURL        @"users/oauth/register"

#define kGetUserInfoURL     @"parents"

#define kAddBabyURL         @"babies"

#define kLoginURL           @"login"
#define kLogoutURL          @"logout"

#define kFeedRecURL         @"feeds/featured"
#define kMyFeedURL          @"feeds/following"

#define kRecBabyURL         @"recommend"
#define kInviteCodeURL      @"users/%ld/babies/%ld/invitation"
#define kInviteVerifyURL    @"users/%ld/babies/%ld/verify"
#define kInviteAcceptURL    @"parents/%ld/code/%@/accept"

#define kUserSearchURL      @"users/search"
#define kTagSearchURL       @"tags/search"

#define kUploadTokenURL     @"qiniu/token/childhood"
#define kUploadFileURL      @"upload"
#define kUploadFeedURL      @"feeds/type/1"

#define kTagsRecommendedURL @"tags/recommended"

#define kTasksURL           @"tasks"
#define kTasksStatusURL     @"tasks/status"

#define kPasterImageURL     @"pasters"

#define kGetPhoneCode       @"sms/%@"

#define kBabyTimeLineURL   @"babies/%ld/feeds/summary?from=%ld&size=%ld"
#define kBabyDetailURL     @"parents/%ld/babies/%ld/detail"
#define kOtherDetailURL    @"parents/%ld/others/%ld/"

//================================================================

#define kQiNiuDomain        @"http://childhood.qiniudn.com/"

#endif
