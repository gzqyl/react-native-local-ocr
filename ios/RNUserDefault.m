//
//  RNUserDefault.m
//  react_native_ocr
//
//  Created by 浪漫小子 on 2023/12/31.
//

#import <Foundation/Foundation.h>
#import "RNUserDefault.h"
#import <React/RCTLog.h>
#import "react_native_ocr-Swift.h"

@implementation RNUserDefault

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(getMLkitLang:(void *)
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    NSString* langCode = [[[RNUserDefaultSwift alloc] init] getMLKitLangSwift];
    resolve(langCode);
  
}

RCT_EXPORT_METHOD(setMLkitLang:(NSString *) langCode
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    
    RNUserDefaultSwift* swiftObj = [[RNUserDefaultSwift alloc] init];
    [swiftObj setMLKitLangSwift:langCode];
    resolve(@"ok");
  
}

RCT_EXPORT_METHOD(isLangSetted:(void *)
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    
    RNUserDefaultSwift* swiftObj = [[RNUserDefaultSwift alloc] init];
    BOOL res = [swiftObj isLangSetted];
    resolve(res);
  
}

@end
