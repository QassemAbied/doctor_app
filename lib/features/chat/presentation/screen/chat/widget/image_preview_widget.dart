import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../../core/theming/app_color.dart';

class ImagePreviewWidget extends StatelessWidget {
  final File image;
  final VoidCallback onRemove;

  const ImagePreviewWidget({
    super.key,
    required this.image,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorManager.grey40,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                image,
                height: 150,
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
          ),

          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              onPressed: onRemove,
              icon: Icon(Icons.close, color: ColorManager.fillRed),
            ),
          ),
        ],
      ),
    );
  }
}
