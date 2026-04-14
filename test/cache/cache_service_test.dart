import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:hive_ce_flutter/adapters.dart';

void main() {
  late CacheService cacheService;
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final dir = await Directory.systemTemp.createTemp();
    Hive.init(dir.path);
  });

  setUp(() async {
    cacheService = CacheService('settings');
    await cacheService.init();
  });

  tearDownAll(() async {
    await cacheService.clearAll();
    await Hive.close();
  });

  test('test cache service', () async {
    await cacheService.write("darkMode", true);
    expect(true, cacheService.get("darkMode"));
  });

  test('test update value', () async {
    await cacheService.write("key", 1);
    await cacheService.write("key", "value");
    expect("value", cacheService.get("key"));
  });
}
