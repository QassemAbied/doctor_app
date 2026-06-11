import 'package:doctor_app/features/notification/domain/entity/local_notification_entities.dart';
import 'package:doctor_app/features/notification/domain/entity/local_notification_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/notification/local_notification.dart';
import '../../../../core/services/supa_base_service/supa_base_notification_service.dart';
import '../../domain/use_case/add_local_notification_usecase.dart';
import '../../domain/use_case/get_local_notification_usecase.dart';
import 'package:timezone/timezone.dart' as tz;
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final GetLocalNotificationUseCase getNotificationsUseCase;

  final AddLocalNotificationUseCase addNotificationUseCase;
  final SupABaseNotificationService _supABaseNotificationService;

  NotificationCubit(
    this.getNotificationsUseCase,
    this.addNotificationUseCase,
    this._supABaseNotificationService,
  ) : super(NotificationInitial());

  final List<NotificationEntity> notifications = [];

  Future<void> getNotifications() async {
    emit(NotificationLoading());

    final response = await getNotificationsUseCase();

    response.fold((l) => emit(NotificationFailure(l.message)), (r) {
      notifications.clear();
      notifications.addAll(r);
      emit(NotificationSuccess(r));
    });
  }

  Future<void> addShowNotification({
    required LocalNotificationParams params,
  }) async {
    await addNotificationUseCase(params);
    await LocalNotification.showNotification(
      title: params.title,
      body: params.body,
    );

    await getNotifications();
  }

  Future<void> addScheduleNotification({
    required LocalNotificationParams params,
    required tz.TZDateTime scheduledDate,
    required int id,
  }) async {
    await addNotificationUseCase(params);
    await LocalNotification.showScheduleNotification(
      title: params.title,
      body: params.body,
      scheduledDate: scheduledDate,
      id: id,
    );

    await getNotifications();
  }

  Future<void> markAsReadNotification(String id) async {
    await _supABaseNotificationService.markAsReadNotification(id);
    print('markAsReadNotification');
    final index = notifications.indexWhere((e) => e.id == id);
    if (index != -1) {
      notifications[index] = notifications[index].copyWith(isRead: true);
    }
    emit(NotificationSuccess(List.from(notifications)));
  }

  Future<void> deleteNotification(String id) async {
    await _supABaseNotificationService.deleteNotification(id);
    print('deleteNotification');
    final index = notifications.indexWhere((e) => e.id == id);
    if (index != -1) {
      notifications.removeAt(index);
    }
    emit(NotificationSuccess(List.from(notifications)));
  }
}
