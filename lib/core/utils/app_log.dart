import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class Log {
  static void init() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      debugPrint(
        '${record.level.name}: ${record.time}: [${record.loggerName}] ${record.message}',
      );

      if (record.error != null) debugPrint('Error: ${record.error}');
      if (record.stackTrace != null) {
        debugPrint('StackTrace: ${record.stackTrace}');
      }
    });
  }

  static final _logger = Logger("Log");

  static void debug(String message) {
    _logger.fine(message);
  }

  static void info(String message) => _logger.info(message);

  static void warning(String message) => _logger.warning(message);

  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.severe(message, error, stackTrace);
  }
}
