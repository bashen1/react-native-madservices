#import "Madservices.h"
#import <AdServices/AdServices.h>
#import <iAd/iAd.h>

@implementation Madservices

RCT_EXPORT_MODULE()

/**
 * 是否支持 AdServices 调用
 */
RCT_EXPORT_METHOD(isSupportAdServices: (RCTPromiseResolveBlock)resolve rejecter: (RCTPromiseRejectBlock)reject) {
    BOOL isSupport = [self isSupportAdServices];
    resolve(@(isSupport));
}

/**
 * 获取自归因数据 Token(AdServices)
 * 此token需要到 https://api-adservices.apple.com/api/v1/ 换取归因数据
 */
RCT_EXPORT_METHOD(getAttributionToken: (RCTPromiseResolveBlock)resolve rejecter: (RCTPromiseRejectBlock)reject) {
    if (@available(iOS 14.3, *)) {
        NSError *error;
        NSString *token = [AAAttribution attributionTokenWithError: &error];
        if (!error) {
            NSDictionary *ret = @{@"code": @(1), @"token": token, @"msg": @""};
            resolve(ret);
        } else {
            NSDictionary *ret = @{@"code": @(-1), @"token": @"", @"msg": [NSString stringWithFormat: @"%ld", (long)error.code]};
            resolve(ret);
        }
    } else {
        NSDictionary *ret = @{@"code": @(0), @"token": @"", @"msg": @"系统版本不支持"};
        resolve(ret);
    }
}

/**
 * 获取自归因数据 (iAd)
 */
RCT_EXPORT_METHOD(getAttributionData: (RCTPromiseResolveBlock)resolve rejecter: (RCTPromiseRejectBlock)reject) {
    if (@available(iOS 14.3, *)) {
        NSDictionary *ret = @{@"code": @(0), @"data": @{}, @"msg": @"系统版本不支持"};
        resolve(ret);
    } else {
        [[ADClient sharedClient] requestAttributionDetailsWithBlock:^(NSDictionary *attrData, NSError *error) {
            if (!error) {
                NSDictionary *ret = @{@"code": @(1), @"data": attrData, @"msg": @""};
                resolve(ret);
            } else {
                NSDictionary *ret = @{@"code": @(-1), @"data": @{}, @"msg": [NSString stringWithFormat: @"%ld", (long)error.code]};
                resolve(ret);
            }
        }];
    }
}


- (BOOL)isSupportAdServices {
    BOOL isSupport = true;
    if (@available(iOS 14.3, *)) {
        isSupport = true;
    } else {
        isSupport = false;
    }
    return isSupport;
}


@end
