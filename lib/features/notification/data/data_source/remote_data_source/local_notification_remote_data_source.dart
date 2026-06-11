import '../../../domain/entity/local_notification_params.dart';
import '../../model/local_notification_model.dart';

abstract class LocalNotificationRemoteDataSource {
  Future<List<NotificationModel>> getNotifications();

  Future<void> addNotification(LocalNotificationParams params);
}
