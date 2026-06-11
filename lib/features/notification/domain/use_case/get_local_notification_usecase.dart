import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../entity/local_notification_entities.dart';
import '../repository.dart';

class GetLocalNotificationUseCase {
  final LocalNotificationRepository _notificationRepository;
  GetLocalNotificationUseCase(this._notificationRepository);
  Future<Either<Failure, List<NotificationEntity>>> call() async {
    return await _notificationRepository.getNotifications();
  }
}
