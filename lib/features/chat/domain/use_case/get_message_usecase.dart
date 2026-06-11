import '../entities/message_entity.dart';
import '../repository.dart';

class GetMessagesUseCase {
  final ChatRepository repository;

  GetMessagesUseCase(this.repository);

  Stream<List<MessageEntity>> call(String receiverId) {
    return repository.getMessages(receiverId);
  }
}
