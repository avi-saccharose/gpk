import 'package:hive_ce_flutter/hive_ce_flutter.dart';

class CacheService<T> {
  final String boxName;

  CacheService(this.boxName);

  Box get _box => Hive.box<T>(boxName);

  Future<void> init() async {
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox<T>(boxName);
    }
  }

  Future<void> write(String key, T data) async {
    await _box.put(key, data);
  }

  T? get(String key) {
    return _box.get(key) as T?;
  }

  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  Future<void> clearAll() async {
    await _box.clear();
  }
}
