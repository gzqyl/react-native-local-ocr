#import <Foundation/Foundation.h>
#import <VisionCamera/FrameProcessorPlugin.h>
#import <VisionCamera/FrameProcessorPluginRegistry.h>
#import "react_native_ocr-Swift.h"

@interface OCRFrameProcessorPlugin (FrameProcessorPluginLoader)
@end

@implementation OCRFrameProcessorPlugin (FrameProcessorPluginLoader)

+ (void)load
{
  [FrameProcessorPluginRegistry addFrameProcessorPlugin:@"scanOCR"
                                        withInitializer:^FrameProcessorPlugin* (NSDictionary* options) {

    //get the async-storage data here...

    //type LangCode = 'en' | 'ja' | 'ko' | 'zh'

    return [[OCRFrameProcessorPlugin alloc] init];
  }];
}

@end
