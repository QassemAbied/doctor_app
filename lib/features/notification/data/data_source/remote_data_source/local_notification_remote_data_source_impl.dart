import 'package:doctor_app/features/notification/data/model/local_notification_model.dart';

import 'package:doctor_app/features/notification/domain/entity/local_notification_params.dart';

import '../../../../../core/services/supa_base_service/supa_base_notification_service.dart';
import 'local_notification_remote_data_source.dart';

class LocalNotificationRemoteDataSourceImpl  implements LocalNotificationRemoteDataSource{
  final SupABaseNotificationService _supABaseNotificationService;
  LocalNotificationRemoteDataSourceImpl(this._supABaseNotificationService);

  @override
  Future<void> addNotification(LocalNotificationParams params)async {
    await _supABaseNotificationService.addNotification(params);

  }

  @override
  Future<List<NotificationModel>> getNotifications() async{
    return await _supABaseNotificationService.getNotifications();
  }
  }
