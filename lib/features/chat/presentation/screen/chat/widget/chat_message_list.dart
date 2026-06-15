import 'package:doctor_app/features/chat/presentation/screen/chat/widget/reciver_message_widget.dart';
import 'package:doctor_app/features/chat/presentation/screen/chat/widget/snder_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../domain/entities/message_entity.dart';
import '../../../controller/chat_cubit.dart';

class ChatMessagesList extends StatelessWidget {
  final String receiverId;

  const ChatMessagesList({super.key, required this.receiverId});

  @override
  Widget build(BuildContext context) {
    final currentUserId = Supabase.instance.client.auth.currentUser!.id;

    return StreamBuilder<List<MessageEntity>>(
      stream: context.read<ChatCubit>().getMessages(receiverId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final messages = snapshot.data!;

        if (messages.isEmpty) {
          return Center(
            child: Text(
              'No Messages Yet',
              style: AppTextStyle.styleRegular14(
                ColorManager.textSecondary,
                context,
              ),
            ),
          );
        }

        return ListView.builder(
          reverse: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];

            final isMe = message.senderId == currentUserId;

            if (isMe) {
              return SenderMessageWidget(
                message: message,
                time: DateFormat('hh:mm a').format(message.createdAt),
              );
            }

            return ReceiverMessageWidget(
              message: message,
              time: DateFormat('hh:mm a').format(message.createdAt),
            );
          },
        );
      },
    );
  }
}
