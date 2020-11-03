import 'package:image_picker/image_picker.dart';

class IMGService {
  pickImage() async {
    var pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    return pickedFile;
  }
}
