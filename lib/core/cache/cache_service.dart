import 'package:hive_ce_flutter/hive_ce_flutter.dart';

class CacheService {
  final String boxName;

  CacheService(this.boxName);

  Box get _box => Hive.box(boxName);

  Future<void> init() async {
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox(boxName);
    }
  }

  Future<void> write<T>(String key, T data) async {
    await _box.put(key, data);
  }

  T? get<T>(String key) {
    return _box.get(key) as T?;
  }

  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  Future<void> clearAll() async {
    await _box.clear();
  }
}
