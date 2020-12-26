import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_ml_kit/services/ml_service.dart';
import 'package:flutter_ml_kit/services/image_service.dart';

class MLProvider extends ChangeNotifier {
  final MLService _MLService = MLService();
  final IMGService _IMGService = IMGService();

  File fileImage;
  bool isLoading = false;
  String result = 'Wait';

  browseImage() async {
    try {
      var getImage = await _IMGService.pickImage();
      fileImage = File(getImage.path);
      result = await _MLService.TextRecognition(File(fileImage.path));
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
