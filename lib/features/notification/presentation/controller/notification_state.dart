abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationSuccess extends NotificationState {
  final List notifications;

  NotificationSuccess(this.notifications);
}

class NotificationFailure extends NotificationState {
  final String message;

  NotificationFailure(this.message);
}

class MakeAsReadNotificationSuccess extends NotificationState {

}

