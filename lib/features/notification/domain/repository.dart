import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/error/error.dart';
import 'package:doctor_app/features/notification/domain/entity/local_notification_entities.dart';

import '../data/model/local_notification_model.dart';
import 'entity/local_notification_params.dart';

abstract class LocalNotificationRepository {
  Future<Either<Failure, List<NotificationEntity>>> getNotifications();

  Future<Either<Failure, void>> addNotification(LocalNotificationParams params);
}
