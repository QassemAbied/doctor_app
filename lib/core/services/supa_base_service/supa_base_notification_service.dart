import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../features/notification/data/model/local_notification_model.dart';
import '../../../features/notification/domain/entity/local_notification_params.dart';

class SupABaseNotificationService {
  final instance = Supabase.instance.client;

  Future<void> addNotification(LocalNotificationParams params) async {
    final user = instance.auth.currentUser;
    if (user == null) {
      throw Exception('User is null');
    }
    return await instance.from('notifications').insert({
      'title': params.title,
      'body': params.body,
      'user_id': user.id,
      'is_read': params.isRead,
    });
  }

  Future<List<NotificationModel>> getNotifications() async {
    final user = instance.auth.currentUser;
    if (user == null) {
      throw Exception('User is null');
    }
    final response = await instance
        .from('notifications')
        .select()
        .eq('user_id', user.id)
        .order('created_at', ascending: false);

    return response
        .map<NotificationModel>((e) => NotificationModel.fromJson(e))
        .toList();
  }

  Future<void> markAsReadNotification(String id) async {
    await instance.from('notifications').update({'is_read': true}).eq('id', id);
  }
  Future<void> deleteNotification(String id) async {
    await instance.from('notifications').delete().eq('id', id);
  }
}
