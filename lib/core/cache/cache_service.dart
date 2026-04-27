import 'package:gpk_app/core/utils/app_log.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

class CacheService<T> {
  final String boxName;

  CacheService(this.boxName);

  Box get _box => Hive.box<T>(boxName);

  Future<void> init() async {
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox<T>(boxName);
      Log.info("init cache: $boxName");
    }
  }

  Future<void> write(String key, T data) async {
    Log.info("writing $key to $boxName");
    await _box.put(key, data);
  }

  T? get(String key) {
    Log.debug("get cache: $key");
    return _box.get(key) as T?;
  }

  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  Future<void> clearAll() async {
    await _box.clear();
  }
}
