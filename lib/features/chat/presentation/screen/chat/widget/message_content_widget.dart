import 'package:flutter/material.dart';

import '../../../../domain/entities/message_entity.dart';
import 'voice_message_widget.dart';

class MessageContentWidget extends StatelessWidget {
  final MessageEntity message;
  final bool isSender;

  const MessageContentWidget({
    super.key,
    required this.message,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (message.image != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(message.image!, width: 220, fit: BoxFit.cover),
          ),

        if (message.audio != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: VoiceMessageWidget(audioUrl: message.audio!),
          ),
        if ((message.message ?? '').isNotEmpty)
          Padding(
            padding: EdgeInsets.only(
              top: message.image != null || message.audio != null ? 8 : 0,
            ),
            child: Text(
              message.message!,
              style: TextStyle(
                color: isSender ? Colors.white : Colors.black,
                height: 1.5,
              ),
            ),
          ),
      ],
    );
  }
}
