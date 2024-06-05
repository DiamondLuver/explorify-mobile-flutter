
// change_notifier.dart
import 'package:flutter/foundation.dart';

class UploadState extends ChangeNotifier {
  bool _isUpload = false;

  bool get isUpload => _isUpload;

  void setIsUpload(bool value) {
    _isUpload = value;
    notifyListeners(); // Notify listeners about the change
  }
}
