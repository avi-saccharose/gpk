import 'package:gpk_app/core/utils/app_log.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

class CacheMetadata {
  final String _boxName;
  Box get _metadataBox => Hive.box<String>(_boxName);
  CacheMetadata(this._boxName);

  Future<void> init() async {
    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox<String>(_boxName);
      Log.info('init Box: $_boxName');
    }
  }

  // For Calendar Cache, we use a time limit based cache logic
  Future<void> updateCacheTimeStamp(String keyName) async {
    final timeStampKey = '${keyName}_timestamp';
    await _metadataBox.put(timeStampKey, DateTime.now().toIso8601String());
  }

  bool isCacheValid(String keyName, Duration maxAge) {
    final timeStampKey = '${keyName}_timestamp';
    final cachedTimeStamp = _metadataBox.get(timeStampKey);
    if (cachedTimeStamp == null) {
      return false;
    }
    try {
      final cacheTime = DateTime.parse(cachedTimeStamp);
      final age = DateTime.now().difference(cacheTime);
      return age < maxAge;
    } catch (e) {
      Log.error('CacheMetadata: Error parsing date', e);
      return false;
    }
  }
}
