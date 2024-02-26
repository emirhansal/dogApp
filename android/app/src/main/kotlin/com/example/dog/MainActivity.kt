package com.example.dog

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import android.os.Build.VERSION

class MainActivity: FlutterActivity() {
    private val CHANNEL = "platform_version"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getAndroidVersion") {
                result.success(VERSION.RELEASE)
            } else {
                result.notImplemented()
            }
        }
    }
}
