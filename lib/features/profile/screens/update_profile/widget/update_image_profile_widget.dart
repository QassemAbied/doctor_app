import 'dart:io';

import 'package:doctor_app/core/common_widgets/dialog/custom_dialog_widget.dart';
import 'package:doctor_app/core/services/supa_base_service/supa_base_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdateImageProfileWidget extends StatefulWidget {
  final String? imageUrl;
  final Function(String imageUrl) onImageUploaded;
  const UpdateImageProfileWidget({
    super.key,
    required this.imageUrl,
    required this.onImageUploaded,
  });

  @override
  State<UpdateImageProfileWidget> createState() =>
      _UpdateImageProfileWidgetState();
}

class _UpdateImageProfileWidgetState extends State<UpdateImageProfileWidget> {
  File? _image;
  String? imageUrl;
  @override
  void initState() {
    imageUrl = widget.imageUrl;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 75,
            backgroundColor: Colors.blue,
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.grey,
              backgroundImage: _image != null
                  ? FileImage(_image!)
                  : (imageUrl != null && imageUrl!.isNotEmpty)
                  ? NetworkImage(imageUrl!)
                  : const AssetImage('assets/images/avater.png')
                        as ImageProvider,
              onBackgroundImageError: (_, _) {
                setState(() {
                  imageUrl = null;
                });
              },
            ),
          ),

          Positioned(
            bottom: 10,

            right: 10,

            child: GestureDetector(
              onTap: () async {
                await selectImage();
              },

              child: CircleAvatar(
                radius: 16,

                backgroundColor: Colors.blue,

                child: const Icon(Icons.edit, size: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> selectImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      if (await image.length() > 1024 * 1024) {
        if (!mounted) return;
        return CustomDialogWidget.showSnackBar(context, 'Image size must not exceed 1MB');
      }
      _image = File(image.path);

      setState(() {});

      imageUrl = await SupABaseStorage().uploadImage(_image!);

      widget.onImageUploaded(imageUrl!);
    }
  }
}
