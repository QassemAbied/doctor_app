abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatSendMessageLoading extends ChatState {}

class ChatSendMessageSuccess extends ChatState {}

class ChatSendMessageFailure extends ChatState {
  final String error;

  ChatSendMessageFailure(this.error);
}
