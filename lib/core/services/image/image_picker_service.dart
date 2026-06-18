import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../common_widgets/dialog/custom_dialog_widget.dart';

class ImagePickerService {
  static Future<File?> pickImage(BuildContext context) async {
    final picker = ImagePicker();

    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return null;

    if (await image.length() > 1024 * 1024) {
      if (context.mounted) {
        CustomDialogWidget.showSnackBar(
          context,
          'Image size must not exceed 1MB',
        );
      }

      return null;
    }

    return File(image.path);
  }
}
