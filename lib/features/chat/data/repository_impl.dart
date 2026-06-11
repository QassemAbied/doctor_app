import 'package:dartz/dartz.dart';

import '../../../core/error/error.dart';
import '../domain/entities/chat_entity.dart';
import '../domain/entities/message_entity.dart';
import '../domain/mapper/chat_mapper.dart';
import '../domain/mapper/message_mapper.dart';
import '../domain/repository.dart';
import 'data_source/remote_data_source/chat_remote_data_source.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> sendMessage({
    required String receiverId,

    required String message,
  }) async {
    try {
      await remoteDataSource.sendMessage(
        receiverId: receiverId,

        message: message,
      );

      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Stream<List<MessageEntity>> getMessages(String receiverId) {
    return remoteDataSource.getMessages(receiverId).map((messages) {
      return messages.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Stream<List<ChatEntity>> getAllChats() {
    return remoteDataSource.getAllChats().map((chats) {
      return chats.map((e) => e.toEntity()).toList();
    });
  }
}
