package com.github.gzqyl.rnocr
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod


class RNUserDefault(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext){

    override fun getName() = "RNUserDefault"

    @ReactMethod fun getMLkitLang(fakeVal: String, promise: Promise) {

        try {
            val eventId = 1
            promise.resolve(eventId)
        } catch (e: Throwable) {
            promise.reject("Create Event Error", e)
        }

    }

    @ReactMethod fun setMLkitLang(langCode: String, promise: Promise) {

        try {
            val eventId = 1
            promise.resolve(eventId)
        } catch (e: Throwable) {
            promise.reject("Create Event Error", e)
        }

    }

    @ReactMethod fun isLangSetted(fakeVal: String, promise: Promise) {

        try {
            val eventId = 1
            promise.resolve(eventId)
        } catch (e: Throwable) {
            promise.reject("Create Event Error", e)
        }

    }


}