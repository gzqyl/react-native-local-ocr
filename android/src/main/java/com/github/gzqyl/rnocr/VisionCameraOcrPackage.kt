 package com.github.gzqyl.rnocr

 import com.facebook.react.ReactPackage
 import com.facebook.react.bridge.NativeModule
 import com.facebook.react.bridge.ReactApplicationContext
 import com.facebook.react.uimanager.ViewManager

 import com.mrousavy.camera.frameprocessor.FrameProcessorPlugin
 import com.mrousavy.camera.frameprocessor.FrameProcessorPluginRegistry;

 class VisionCameraOcrPackage : ReactPackage {
     override fun createNativeModules(reactContext: ReactApplicationContext): List<NativeModule> {
         if(!OCRFrameProcessorPlugin.isRegistered){
             OCRFrameProcessorPlugin.isRegistered = true
             FrameProcessorPluginRegistry.addFrameProcessorPlugin("scanOCR") {
                 OCRFrameProcessorPlugin(it)
             }
         }
         return emptyList()
     }

     override fun createViewManagers(reactContext: ReactApplicationContext): List<ViewManager<*, *>> {
         return emptyList()
     }
 }
