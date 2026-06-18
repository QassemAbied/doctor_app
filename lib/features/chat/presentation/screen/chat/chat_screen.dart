import 'dart:async';
import 'dart:io';
import 'package:doctor_app/core/services/supa_base_service/supa_base_storage.dart';
import 'package:doctor_app/features/chat/presentation/controller/chat_cubit.dart';
import 'package:doctor_app/features/chat/presentation/screen/chat/widget/chat_input_bar.dart';
import 'package:doctor_app/features/chat/presentation/screen/chat/widget/chat_message_list.dart';
import 'package:doctor_app/features/chat/presentation/screen/chat/widget/image_preview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/audio/audio_service.dart';
import '../../../../../core/services/image/image_picker_service.dart';

class ChatScreen extends StatefulWidget {
  final String receiverId;
  final String doctorName;

  const ChatScreen({
    super.key,
    required this.receiverId,
    required this.doctorName,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();

  final VoiceRecorderService recorderService = VoiceRecorderService();


  File? selectedImage;

  bool isRecording = false;

  int recordingSeconds = 0;

  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    recorderService.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    final image = await ImagePickerService.pickImage(context);

    if (image == null) return ;

    setState(() {
      selectedImage = image;
    });
  }

  Future<void> sendMessage() async {
    if (controller.text.trim().isEmpty && selectedImage == null) {
      return;
    }

    String? imageUrl;

    if (selectedImage != null) {
      imageUrl = await SupABaseStorage().sendImageChat(selectedImage!);
    }
    if (!mounted) return;

    await context.read<ChatCubit>().sendMessage(
      receiverId: widget.receiverId,
      message: controller.text.trim().isEmpty ? null : controller.text.trim(),
      imageUrl: imageUrl,
    );

    controller.clear();

    setState(() {
      selectedImage = null;
    });
  }

  Future<void> startRecord(LongPressStartDetails details) async {
    setState(() {
      isRecording = true;
      recordingSeconds = 0;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;

      setState(() {
        recordingSeconds++;
      });
    });

    await recorderService.start();
  }

  Future<void> stopRecord(LongPressEndDetails details) async {
    timer?.cancel();

    setState(() {
      isRecording = false;
    });

    final path = await recorderService.stop();

    if (path == null) return;

    final audioUrl = await SupABaseStorage().uploadVoice(File(path));
    if (!mounted) return;

    await context.read<ChatCubit>().sendMessage(
      receiverId: widget.receiverId,
      audioUrl: audioUrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.doctorName)),

      body: Column(
        children: [
          Expanded(child: ChatMessagesList(receiverId: widget.receiverId)),

          if (selectedImage != null)
            ImagePreviewWidget(
              image: selectedImage!,
              onRemove: () {
                setState(() {
                  selectedImage = null;
                });
              },
            ),

          ChatInputBar(
            controller: controller,
            isRecording: isRecording,
            recorderController: recorderService.recorderController,
            recordingSeconds: recordingSeconds,
            onSend: sendMessage,
            onPickImage: pickImage,
            onRecordStart: startRecord,
            onRecordEnd: stopRecord,
          ),
        ],
      ),
    );
  }
}
