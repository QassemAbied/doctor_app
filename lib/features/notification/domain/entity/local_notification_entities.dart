class NotificationEntity {
  final String id;

  final String userId;

  final String title;

  final String body;

  final bool isRead;

  final DateTime createdAt;

  NotificationEntity({
    required this.id,

    required this.userId,

    required this.title,

    required this.body,

    required this.isRead,

    required this.createdAt,
  });

  NotificationEntity copyWith({
    String? id,

    String? userId,

    String? title,

    String? body,

    bool? isRead,

    DateTime? createdAt,
  }) {
    return NotificationEntity(
      id: id ?? this.id,

      userId: userId ?? this.userId,

      title: title ?? this.title,

      body: body ?? this.body,

      isRead: isRead ?? this.isRead,

      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory NotificationEntity.fake() {
    return NotificationEntity(
      id: '1',

      userId: '1',

      title: 'Appointment',

      body: 'Success booking ',

      isRead: false,

      createdAt: DateTime.now(),
    );
  }
}
