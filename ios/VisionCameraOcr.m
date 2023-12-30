#import <Foundation/Foundation.h>
#import <VisionCamera/FrameProcessorPlugin.h>
#import <VisionCamera/FrameProcessorPluginRegistry.h>

#import "react-native-ocr-Swift.h"

@interface OCRFrameProcessorPlugin (FrameProcessorPluginLoader)
@end

@implementation OCRFrameProcessorPlugin (FrameProcessorPluginLoader)

+ (void)load
{
  [FrameProcessorPluginRegistry addFrameProcessorPlugin:@"scanOCR"
                                        withInitializer:^FrameProcessorPlugin* (NSDictionary* options) {
    return [[OCRFrameProcessorPlugin alloc] init];
  }];
}

@end
