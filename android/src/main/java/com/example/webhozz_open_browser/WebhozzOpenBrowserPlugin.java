package com.example.webhozz_open_browser;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.embedding.engine.plugins.PluginRegistry;

/** WebhozzOpenBrowserPlugin */
public class WebhozzOpenBrowserPlugin implements FlutterPlugin, MethodCallHandler,ActivityAware {

  private Activity activity;
  private Context context;

  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "webhozz_open_browser");
    channel.setMethodCallHandler(this);
    this.context = flutterPluginBinding.getApplicationContext();
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    String url = call.argument("url");
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if(call.method.equals("webhozzOpenBrowser")) {
      webhozzOpenBrowser(call,result,url);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onAttachedToActivity(ActivityPluginBinding binding) {
    this.activity = binding.getActivity();
  }

  @Override
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding){
    onAttachedToActivity(binding);
  }

  @Override
  public void onDetachedFromActivity() {
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }


  private void webhozzOpenBrowser(@NonNull MethodCall call, @NonNull Result result, String url){
    Activity activity1 = this.activity;
    if (activity1 == null) {
      return;
    }
    Intent intent = new Intent(Intent.ACTION_VIEW);
    intent.setData(Uri.parse(url));

    activity.startActivity(intent);
    result.success(true);
  }
}
