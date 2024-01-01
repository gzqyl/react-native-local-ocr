//
//  RNUserDefault.m
//  react_native_ocr
//
//  Created by gzqyl on 2023/12/31.
//

#import <Foundation/Foundation.h>
#import "RNUserDefault.h"
#import <React/RCTLog.h>
#import <VisionCamera/FrameProcessorPlugin.h>
#import <VisionCamera/FrameProcessorPluginRegistry.h>
#import "react_native_ocr-Swift.h"

@implementation RNUserDefault

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(getMLkitLang:()
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

RCT_EXPORT_METHOD(isLangSetted:()
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    
    RNUserDefaultSwift* swiftObj = [[RNUserDefaultSwift alloc] init];
    BOOL res = [swiftObj isLangSetted];
    if (res) {
        resolve(@YES);
    }else{
        resolve(@NO);
    }
  
}

@end
