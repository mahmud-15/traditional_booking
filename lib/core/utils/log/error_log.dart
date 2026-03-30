import 'package:flutter/foundation.dart';

void errorLog(dynamic error, {String? source}) {
  if (kDebugMode) {
    print("Error from $source: $error");
  }
}
