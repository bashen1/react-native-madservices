#import "Madservices.h"
#import <AdServices/AdServices.h>

@implementation Madservices

RCT_EXPORT_MODULE()

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

@end
