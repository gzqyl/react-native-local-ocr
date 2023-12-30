#import <Foundation/Foundation.h>
#import "RNOCRModule.h"
#import <React/RCTLog.h>
#import <AVFoundation/AVFoundation.h>
#import <VisionKit/VisionKit.h>
#import <Vision/Vision.h>

@import MLKitCommon;
@import MLKitVision;
@import MLKitTextRecognitionCommon;
@import MLKitTextRecognition;
@import MLKitTextRecognitionChinese;
@import MLKitTextRecognitionJapanese;
@import MLKitTextRecognitionKorean;
@import MLKitTextRecognitionDevanagari;

@implementation RNOCRModule

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(recognizeImage:(NSString *)url
                  lang: (NSString *)localLang
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
  
  RCTLogInfo(@"URL: %@", url);
  
  NSURL *_url = [NSURL URLWithString:url];
  NSData *imageData = [NSData dataWithContentsOfURL:_url];
  UIImage *image = [UIImage imageWithData:imageData];
  
  MLKVisionImage *visionImage = [[MLKVisionImage alloc] initWithImage:image];
  visionImage.orientation = image.imageOrientation;
    
  MLKTextRecognizer *textRecognizer;
    
  if ([localLang isEqualToString:@"en"]){
      MLKTextRecognizerOptions *latinOptions = [[MLKTextRecognizerOptions alloc] init];
      textRecognizer = [MLKTextRecognizer textRecognizerWithOptions:latinOptions];
  } else if ([localLang isEqualToString:@"zh"]){
      MLKChineseTextRecognizerOptions *chineseOptions = [[MLKChineseTextRecognizerOptions alloc] init];
      textRecognizer = [MLKTextRecognizer textRecognizerWithOptions:chineseOptions];
  } else if ([localLang isEqualToString:@"jp"]){
      MLKJapaneseTextRecognizerOptions *japaneseOptions = [[MLKJapaneseTextRecognizerOptions alloc] init];
      textRecognizer = [MLKTextRecognizer textRecognizerWithOptions:japaneseOptions];
  } else if ([localLang isEqualToString:@"kr"]){
      MLKKoreanTextRecognizerOptions *koreanOptions = [[MLKKoreanTextRecognizerOptions alloc] init];
      textRecognizer = [MLKTextRecognizer textRecognizerWithOptions:koreanOptions];
  } else {
      MLKDevanagariTextRecognizerOptions *devanagariOptions = [[MLKDevanagariTextRecognizerOptions alloc] init];
      textRecognizer = [MLKTextRecognizer textRecognizerWithOptions:devanagariOptions];
  }
  
  [textRecognizer processImage:visionImage
                    completion:^(MLKText *_Nullable result,
                                 NSError *_Nullable error) {
    if (error != nil || result == nil) {
      reject(@"text_recognition", @"text recognition is failed", nil);
      return;
    }
    NSMutableDictionary *response= [NSMutableDictionary dictionary];
    
    NSMutableArray *blocks = [NSMutableArray array];
    
    for (MLKTextBlock *block in result.blocks) {
      NSMutableDictionary *blockDict = [NSMutableDictionary dictionary];
      [blockDict setValue: block.text forKey:@"text"];
      [blocks addObject: blockDict];
    }
    
    [response setValue:blocks forKey:@"blocks"];
    
    resolve(response);
  }];
  
}

@end