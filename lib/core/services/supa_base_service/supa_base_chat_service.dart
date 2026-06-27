// import 'package:flutter/foundation.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
//
// import '../../../features/chat/data/model/chat_model.dart';
// import '../../../features/chat/data/model/message_model.dart';
// import '../../../features/home/data/models/doctor_model.dart';
//
// class SupABaseChatService {
//   final instance = Supabase.instance.client;
//
//   Future<void> sendMessage({
//     required String receiverId,
//     String? message,
//     String? imageUrl,
//     String? audioUrl,
//   })
//   async {
//     try {
//       final currentUser = instance.auth.currentUser;
//
//       if (currentUser == null) return;
//
//       await instance.from('messages').insert({
//         'sender_id': currentUser.id,
//         'receiver_id': receiverId,
//         'message': message,
//         'image': imageUrl,
//         'audio': audioUrl,
//       });
//       print('====================');
//       print('SEND MESSAGE CALLED');
//       print('message: $message');
//       print('image: $imageUrl');
//       print('====================');
//     } catch (e) {
//       if (kDebugMode) {
//         print('SEND MESSAGE ERROR => $e');
//       }
//     }
//   }
//
//   Stream<List<MessageModel>> getMessages(String receiverId) {
//     final currentUser = instance.auth.currentUser;
//
//     return instance
//         .from('messages')
//         .stream(primaryKey: ['id'])
//         .order('created_at')
//         .map((data) {
//           final messages = data
//               .map<MessageModel>((e) => MessageModel.fromJson(e))
//               .where(
//                 (message) =>
//                     (message.senderId == currentUser!.id &&
//                         message.receiverId == receiverId) ||
//                     (message.senderId == receiverId &&
//                         message.receiverId == currentUser.id),
//               )
//               .toList();
//
//           final uniqueMessages = {
//             for (final msg in messages) msg.id: msg,
//           }.values.toList();
//
//           return uniqueMessages;
//         });
//   }
//
//   Future<Map<String, DoctorModel>> getDoctorsMap() async {
//     final doctors = await instance.from('doctors').select('''
//         *,
//         specializations(
//           name,
//           image
//         )
//       ''');
//
//     final doctorsMap = <String, DoctorModel>{};
//
//     for (final doctor in doctors) {
//       final model = DoctorModel.fromJson(doctor);
//
//       doctorsMap[model.id] = model;
//     }
//
//     return doctorsMap;
//   }
//   Future<Map<String, dynamic>> getUsersMap() async {
//     final users = await instance.from('users').select();
//
//     final usersMap = <String, dynamic>{};
//
//     for (final user in users) {
//       usersMap[user['id']] = user;
//     }
//
//     return usersMap;
//   }
//   Future<String> getCurrentUserRole() async {
//     final userId = instance.auth.currentUser!.id;
//
//     final response = await instance
//         .from('users')
//         .select('role')
//         .eq('id', userId)
//         .single();
//
//     return response['role'];
//   }
//   Stream<List<ChatModel>> getAllChats() async* {
//     final currentUser = instance.auth.currentUser;
//
//     final doctorsMap = await getDoctorsMap();
//
//     yield* instance
//         .from('messages')
//         .stream(primaryKey: ['id'])
//         .order('created_at', ascending: false)
//         .map((data) {
//           final chats = <String, ChatModel>{};
//
//           for (final e in data) {
//             final model = MessageModel.fromJson(e);
//
//             final isMe = model.senderId == currentUser!.id;
//
//             final otherUserId = isMe ? model.receiverId : model.senderId;
//
//             if (!chats.containsKey(otherUserId)) {
//               final doctor = doctorsMap[otherUserId];
//
//               chats[otherUserId] = ChatModel(
//                 receiverId: otherUserId,
//
//                 name: doctor?.name ?? 'Doctor',
//
//                 image: doctor?.image ?? '',
//
//                 lastMessage: model.message ?? '',
//
//                 time: model.createdAt.toString(),
//               );
//             }
//           }
//
//           return chats.values.toList();
//         });
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../features/chat/data/model/chat_model.dart';
import '../../../features/chat/data/model/message_model.dart';
import '../../../features/home/data/models/doctor_model.dart';

class SupABaseChatService {
  final instance = Supabase.instance.client;

  Future<void> sendMessage({
    required String receiverId,
    String? message,
    String? imageUrl,
    String? audioUrl,
  }) async {
    try {
      final currentUser = instance.auth.currentUser;

      if (currentUser == null) return;

      await instance.from('messages').insert({
        'sender_id': currentUser.id,
        'receiver_id': receiverId,
        'message': message,
        'image': imageUrl,
        'audio': audioUrl,
      });

      print('====================');
      print('SEND MESSAGE CALLED');
      print('message: $message');
      print('image: $imageUrl');
      print('====================');
    } catch (e) {
      if (kDebugMode) {
        print('SEND MESSAGE ERROR => $e');
      }
    }
  }

  // Stream<List<MessageModel>> getMessages(String receiverId) {
  //   final currentUser = instance.auth.currentUser;
  //
  //   return instance
  //       .from('messages')
  //       .stream(primaryKey: ['id'])
  //       .order('created_at')
  //       .map((data) {
  //         final messages = data
  //             .map<MessageModel>((e) => MessageModel.fromJson(e))
  //             .where(
  //               (message) =>
  //                   (message.senderId == currentUser!.id &&
  //                       message.receiverId == receiverId) ||
  //                   (message.senderId == receiverId &&
  //                       message.receiverId == currentUser.id),
  //             )
  //             .toList();
  //
  //         final uniqueMessages = {
  //           for (final msg in messages) msg.id: msg,
  //         }.values.toList();
  //
  //         return uniqueMessages;
  //       });
  // }
  Stream<List<MessageModel>> getMessages(String receiverId) {
    final currentUser = instance.auth.currentUser;

    // حماية: لو مفيش يوزر مسجل دخول، بنرجع Stream فاضي عشان التطبيق مايعملش Crash
    if (currentUser == null) return const Stream.empty();

    final myId = currentUser.id;

    return instance
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at') // ترتيب زمني من الأقدم للأحدث
        .map((data) {
          // هنا بنفلتر الرسايل اللي بيني وبين الشخص ده فقط
          return data
              .where(
                (e) =>
                    (e['sender_id'] == myId &&
                        e['receiver_id'] == receiverId) ||
                    (e['sender_id'] == receiverId && e['receiver_id'] == myId),
              )
              .map((e) => MessageModel.fromJson(e))
              .toList(); // الـ stream أصلاً بيمنع التكرار، فمفيش داعي لأي كود إضافي هنا
        });
  }

  /// ===============================
  /// Doctors Map
  /// ===============================
  //
  // Future<Map<String, DoctorModel>> getDoctorsMap() async {
  //   final doctors = await instance.from('doctors').select('''
  //     *,
  //     specializations(
  //       name,
  //       image
  //     )
  //   ''');
  //
  //   final doctorsMap = <String, DoctorModel>{};
  //
  //   for (final doctor in doctors) {
  //     final model = DoctorModel.fromJson(doctor);
  //     doctorsMap[model.userId] = model;
  //   }
  //
  //   return doctorsMap;
  // }
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

      if (model.userId == null) continue;

      doctorsMap[model.userId!] = model;
    }

    return doctorsMap;
  }
  /// ===============================
  /// Users Map
  /// ===============================

  Future<Map<String, dynamic>> getUsersMap() async {
    final users = await instance.from('users').select();

    final usersMap = <String, dynamic>{};

    for (final user in users) {
      usersMap[user['id']] = user;
    }

    return usersMap;
  }

  /// ===============================
  /// Current User Role
  /// ===============================

  Future<String> getCurrentUserRole() async {
    final userId = instance.auth.currentUser!.id;

    final response = await instance
        .from('users')
        .select('role')
        .eq('id', userId)
        .single();

    return response['role'];
  }

  /// ===============================
  /// Chats
  /// ===============================
  Stream<List<ChatModel>> getAllChats() async* {
    final currentUser = instance.auth.currentUser;
    if (currentUser == null) return;

    final myId = currentUser.id;

    // بنجيب الـ Role مرة واحدة (يفضل في المستقبل تخزنها عندك في الموبايل بدل ما تسألها للداتابيز كل مرة)
    final role = await getCurrentUserRole();

    yield* instance
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at', ascending: false)
        // بنستخدم asyncMap عشان نقدر نكلم الداتابيز جوه الـ Stream
        .asyncMap((data) async {
          final chatsMap = <String, ChatModel>{};
          final userIdsToFetch = <String>{}; // Set عشان نجمع أرقام الناس اللي كلمناهم بدون تكرار

          // 1. تجميع أحدث الرسايل ومعرفة الـ IDs بتاعة الناس اللي كلمناهم
          for (final e in data) {
            final senderId = e['sender_id'] as String;
            final receiverId = e['receiver_id'] as String;

            // لو الرسالة دي تخص ناس تانية في التطبيق، نتجاهلها
            if (senderId != myId && receiverId != myId) continue;

            final otherUserId = senderId == myId ? receiverId : senderId;

            // لو أخدنا أحدث رسالة للشخص ده خلاص، نتجاهل بقية رسايله القديمة
            if (chatsMap.containsKey(otherUserId)) continue;

            // بنحط بيانات مؤقتة لحد ما نجيب اسمه وصورته من الداتابيز
            chatsMap[otherUserId] = ChatModel(
              receiverId: otherUserId,
              name: 'جاري التحميل...', // اسم مؤقت
              image: '',
              lastMessage:
                  e['message'] ?? 'مرفق', // لو مفيش نص، نكتب "مرفق" (صورة/صوت)
              time: e['created_at'].toString(),
            );

            // بنضيف رقم الشخص ده للقائمة اللي هنبحث عنها
            userIdsToFetch.add(otherUserId);
          }

          // 2. هنجيب بيانات الناس اللي كلمناهم "فقط" مش كل الناس اللي في التطبيق!
          if (userIdsToFetch.isNotEmpty) {
            final tableName = role == 'patient' ? 'doctors' : 'users';
            final selectQuery = role == 'patient'
                ? '*, specializations(name, image)'
                : '*';

            // in_ filter بيجيب بيانات الناس اللي الـ IDs بتاعتهم في القائمة دي بس
            final usersData = await instance
                .from(tableName)
                .select(selectQuery)
                .filter(
                  role == 'patient' ? 'user_id' : 'id',
                  'in',
                  userIdsToFetch.toList(),
                );

            // 3. نركب الأسماء والصور الحقيقية على الرسايل
            for (final user in usersData) {
              final id = role == 'patient' ? user['user_id'] : user['id'];

              if (chatsMap.containsKey(id)) {
                final oldChat = chatsMap[id]!;
                chatsMap[id] = ChatModel(
                  receiverId: oldChat.receiverId,
                  name: user['name'] ?? 'بدون اسم',
                  image:
                      user['image'] ??
                      (user['specializations']?['image'] ?? ''),
                  lastMessage: oldChat.lastMessage,
                  time: oldChat.time,
                );
              }
            }
          }

          return chatsMap.values.toList();
        });
  }

  // Stream<List<ChatModel>> getAllChats() async* {
  //   final currentUser = instance.auth.currentUser!;
  //
  //   final role = await getCurrentUserRole();
  //
  //   final doctorsMap = role == 'patient' ? await getDoctorsMap() : null;
  //
  //   final usersMap = role == 'doctor' ? await getUsersMap() : null;
  //
  //   yield* instance
  //       .from('messages')
  //       .stream(primaryKey: ['id'])
  //       .order('created_at', ascending: false)
  //       .map((data) {
  //         final chats = <String, ChatModel>{};
  //
  //         for (final e in data) {
  //           final model = MessageModel.fromJson(e);
  //
  //           final isMe = model.senderId == currentUser.id;
  //
  //           final otherUserId = isMe ? model.receiverId : model.senderId;
  //
  //           if (chats.containsKey(otherUserId)) continue;
  //
  //           if (role == 'patient') {
  //             final doctor = doctorsMap?[otherUserId];
  //
  //             chats[otherUserId] = ChatModel(
  //               receiverId: otherUserId,
  //               name: doctor?.name ?? 'Doctor',
  //               image: doctor?.image ?? '',
  //               lastMessage: model.message ?? '',
  //               time: model.createdAt.toString(),
  //             );
  //           } else {
  //             final user = usersMap?[otherUserId];
  //
  //             chats[otherUserId] = ChatModel(
  //               receiverId: otherUserId,
  //               name: user?['name'] ?? 'Patient',
  //               image: user?['image'] ?? '',
  //               lastMessage: model.message ?? '',
  //               time: model.createdAt.toString(),
  //             );
  //           }
  //         }
  //
  //         return chats.values.toList();
  //       });
  // }
}
