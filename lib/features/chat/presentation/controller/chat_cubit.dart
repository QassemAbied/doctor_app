import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/chat_entity.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/use_case/get_all_message_usecase.dart';
import '../../domain/use_case/get_message_usecase.dart';
import '../../domain/use_case/send_message.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final SendMessageUseCase sendMessageUseCase;

  final GetMessagesUseCase getMessagesUseCase;
  final GetAllChatsUseCase getAllChatsUseCase;

  ChatCubit(
    this.sendMessageUseCase,
    this.getMessagesUseCase,
    this.getAllChatsUseCase,
  ) : super(ChatInitial());


  Future<void> sendMessage({
    required String receiverId,

    required String message,
  }) async {
    emit(ChatSendMessageLoading());

    final response = await sendMessageUseCase(
      receiverId: receiverId,

      message: message,
    );

    response.fold(
      (failure) {
        emit(ChatSendMessageFailure(failure.message));
      },

      (_) {
        emit(ChatSendMessageSuccess());
      },
    );
  }


  Stream<List<MessageEntity>> getMessages(String receiverId) {
    return getMessagesUseCase(receiverId);
  }

  Stream<List<ChatEntity>> getAllChats() {
    return getAllChatsUseCase();
  }
}
