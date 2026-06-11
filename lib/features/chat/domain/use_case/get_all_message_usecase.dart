import '../entities/chat_entity.dart';
import '../repository.dart';

class GetAllChatsUseCase {
  final ChatRepository repository;
  GetAllChatsUseCase(this.repository);
  Stream<List<ChatEntity>> call() {
    return repository.getAllChats();
  }
}
