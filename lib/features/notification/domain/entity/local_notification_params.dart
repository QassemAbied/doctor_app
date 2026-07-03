class LocalNotificationParams {
  final String id;
  final String title;
  final String body;
  final bool isRead;

  LocalNotificationParams({
    required this.title,
    required this.body,
    required this.isRead, required this.id});
}