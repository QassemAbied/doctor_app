import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common_widgets/custom_text_filed.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/utils/spacing.dart';

class ChatInputBar extends StatelessWidget {
  final TextEditingController controller;

  final bool isRecording;

  final VoidCallback onSend;

  final VoidCallback onPickImage;

  final Function(LongPressStartDetails) onRecordStart;

  final Function(LongPressEndDetails) onRecordEnd;

  final RecorderController recorderController;

  final int recordingSeconds;

  const ChatInputBar({
    super.key,
    required this.controller,
    required this.isRecording,
    required this.onSend,
    required this.onPickImage,
    required this.onRecordStart,
    required this.onRecordEnd,
    required this.recorderController,
    required this.recordingSeconds,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: ColorManager.whiteColor,
        boxShadow: [
          BoxShadow(
            color: ColorManager.blackColor.withValues(alpha: .03),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: isRecording
                      ? Container(
                          height: 55,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: ColorManager.grey40,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.mic, color: Colors.red),

                              horizontalSpace(8),

                              Expanded(
                                child: AudioWaveforms(
                                  recorderController: recorderController,
                                  size: const Size(double.infinity, 40),
                                  waveStyle: const WaveStyle(
                                    waveColor: Colors.red,
                                    extendWaveform: true,
                                    showMiddleLine: false,
                                  ),
                                ),
                              ),

                              Text('${recordingSeconds}s'),
                            ],
                          ),
                        )
                      : AppTextField(
                          controller: controller,
                          hintText: 'Type a message ...',
                          validator: (_) {},
                          enabled: true,
                        ),
                ),

                GestureDetector(
                  onLongPressStart: onRecordStart,

                  onLongPressEnd: onRecordEnd,

                  child: Icon(
                    isRecording ? Icons.mic : Icons.mic_none,
                    color: ColorManager.grey60,
                  ),
                ),

                horizontalSpace(10),

                IconButton(
                  onPressed: onPickImage,
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: ColorManager.grey60,
                  ),
                ),
              ],
            ),
          ),

          horizontalSpace(14),

          GestureDetector(
            onTap: onSend,
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: ColorManager.primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.send, color: ColorManager.whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}
