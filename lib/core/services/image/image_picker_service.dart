import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  Future<File?> pickImage() async {
    final picker = ImagePicker();

    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return null;

    if (await image.length() > 1024 * 1024) {
      return null;
    }

    return File(image.path);
  }
}
