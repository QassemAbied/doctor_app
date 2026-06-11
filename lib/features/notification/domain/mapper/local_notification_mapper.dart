import '../../data/model/local_notification_model.dart';
import '../entity/local_notification_entities.dart';

class NotificationMapper {
  static NotificationEntity toEntity(NotificationModel model) {
    return NotificationEntity(
      id: model.id,

      userId: model.userId,

      title: model.title,

      body: model.body,

      isRead: model.isRead,

      createdAt: model.createdAt,
    );
  }

  static List<NotificationEntity> toEntityList(List<NotificationModel> models) {
    return models.map((e) => toEntity(e)).toList();
  }
}
