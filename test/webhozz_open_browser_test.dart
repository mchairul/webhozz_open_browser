import 'package:flutter_test/flutter_test.dart';
import 'package:webhozz_open_browser/webhozz_open_browser.dart';
import 'package:webhozz_open_browser/webhozz_open_browser_platform_interface.dart';
import 'package:webhozz_open_browser/webhozz_open_browser_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWebhozzOpenBrowserPlatform
    with MockPlatformInterfaceMixin
    implements WebhozzOpenBrowserPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
  
  @override
  Future<String?> webhozzOpenBrowser() {
    // TODO: implement webhozzOpenBrowser
    throw UnimplementedError();
  }
}

void main() {
  final WebhozzOpenBrowserPlatform initialPlatform = WebhozzOpenBrowserPlatform.instance;

  test('$MethodChannelWebhozzOpenBrowser is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWebhozzOpenBrowser>());
  });

  test('getPlatformVersion', () async {
    WebhozzOpenBrowser webhozzOpenBrowserPlugin = WebhozzOpenBrowser();
    MockWebhozzOpenBrowserPlatform fakePlatform = MockWebhozzOpenBrowserPlatform();
    WebhozzOpenBrowserPlatform.instance = fakePlatform;

    expect(await webhozzOpenBrowserPlugin.getPlatformVersion(), '42');
  });
}
