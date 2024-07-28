import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webhozz_open_browser/webhozz_open_browser_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelWebhozzOpenBrowser platform = MethodChannelWebhozzOpenBrowser();
  const MethodChannel channel = MethodChannel('webhozz_open_browser');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
