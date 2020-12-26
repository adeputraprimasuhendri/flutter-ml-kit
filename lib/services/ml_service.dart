import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class MLService {
  TextRecognition(fileimage) async {
    var firebaseVisionImage = FirebaseVisionImage.fromFile(fileimage);
    var textRecognizer = FirebaseVision.instance.textRecognizer();
    var visionText = await textRecognizer.processImage(firebaseVisionImage);
    var result = '${visionText.text}';
    textRecognizer.close();
    return result;
  }
}
