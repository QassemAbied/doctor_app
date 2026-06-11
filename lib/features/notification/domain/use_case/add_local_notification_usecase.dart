import 'package:dartz/dartz.dart';
import 'package:doctor_app/features/notification/domain/repository.dart';

import '../../../../core/error/error.dart';
import '../entity/local_notification_params.dart';

class AddLocalNotificationUseCase {
  final LocalNotificationRepository _notificationRepository;
  AddLocalNotificationUseCase(this._notificationRepository);
  Future<Either<Failure, void>> call(LocalNotificationParams params) async {
    return await _notificationRepository.addNotification(params);
  }
}
