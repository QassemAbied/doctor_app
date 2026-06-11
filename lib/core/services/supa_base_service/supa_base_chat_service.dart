import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../features/chat/data/model/chat_model.dart';
import '../../../features/chat/data/model/message_model.dart';
import '../../../features/home/data/models/doctor_model.dart';

class SupABaseChatService {
  final instance = Supabase.instance.client;

  Future<void> sendMessage({
    required String receiverId,

    required String message,
  }) async {
    try {
      final currentUser = instance.auth.currentUser;

      if (currentUser == null) {
        return;
      }

      await instance.from('messages').insert({
        'sender_id': currentUser.id,

        'receiver_id': receiverId,

        'message': message,
      });
    } catch (e) {
      if (kDebugMode) {
        print(
          'SEND MESSAGE ERROR => '
          '$e',
        );
      }
    }
  }

  Stream<List<MessageModel>> getMessages(String receiverId) {
    final currentUser = instance.auth.currentUser;

    final response = instance
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at');
    return response.map((data) {
      return data
          .map<MessageModel>((e) => MessageModel.fromJson(e))
          .where(
            (message) =>
                (message.senderId == currentUser!.id &&
                    message.receiverId == receiverId) ||
                (message.senderId == receiverId &&
                    message.receiverId == currentUser.id),
          )
          .toList();
    });
  }

  Future<Map<String, DoctorModel>> getDoctorsMap() async {
    final doctors = await instance.from('doctors').select('''
        *,
        specializations(
          name,
          image
        )
      ''');

    final doctorsMap = <String, DoctorModel>{};

    for (final doctor in doctors) {
      final model = DoctorModel.fromJson(doctor);

      doctorsMap[model.id] = model;
    }

    return doctorsMap;
  }

  Stream<List<ChatModel>> getAllChats() async* {
    final currentUser = instance.auth.currentUser;

    final doctorsMap = await getDoctorsMap();

    yield* instance
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at', ascending: false)
        .map((data) {
          final chats = <String, ChatModel>{};

          for (final e in data) {
            final model = MessageModel.fromJson(e);

            final isMe = model.senderId == currentUser!.id;

            final otherUserId = isMe ? model.receiverId : model.senderId;

            if (!chats.containsKey(otherUserId)) {
              final doctor = doctorsMap[otherUserId];

              chats[otherUserId] = ChatModel(
                receiverId: otherUserId,

                name: doctor?.name ?? 'Doctor',

                image: doctor?.image ?? '',

                lastMessage: model.message ?? '',

                time: model.createdAt.toString(),
              );
            }
          }

          return chats.values.toList();
        });
  }
}
