import 'package:doctor_app/core/common_widgets/dummy_data.dart';
import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/core/theming/app_styles.dart';
import 'package:doctor_app/core/utils/spacing.dart';
import 'package:doctor_app/features/notification/presentation/controller/notification_cubit.dart';
import 'package:doctor_app/features/notification/presentation/controller/notification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/utils/di/injection_container.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;

    print("Doctor Screen Current User => ${user?.id}");
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),

      body: BlocProvider(
        create: (context) => sl<NotificationCubit>()..getNotifications(),

        child: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state is NotificationFailure) {
              return Center(child: Text(state.message));
            }

            final isLoaded = state is NotificationSuccess;
            final notifications = state is NotificationSuccess
                ? state.notifications
                : DummyData.fakeNotifications;
            if (notifications.isEmpty) {
              return const Center(child: Text('No Notifications Yet 😄🔥'));
            }
            return Skeletonizer(
              enabled: !isLoaded,
              child: ListView.separated(
                padding: const EdgeInsets.all(16),

                itemCount: notifications.length,

                separatorBuilder: (_, _) => const SizedBox(height: 12),

                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  final isRead = notification.isRead == true;

                  return GestureDetector(
                    onTap: () {
                      context.read<NotificationCubit>().markAsReadNotification(
                        notification.id,
                      );
                    },
                    child: ItemNotificationWidget(
                      isRead: isRead,
                      notification: notification,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ItemNotificationWidget extends StatelessWidget {
  const ItemNotificationWidget({
    super.key,
    required this.isRead,
    required this.notification,
  });

  final bool isRead;
  final dynamic notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: isRead ? ColorManager.whiteColor : ColorManager.primary40,

        borderRadius: BorderRadius.circular(16),

        boxShadow: [
          BoxShadow(
            color: Colors.black12,

            blurRadius: 8,

            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: isRead
                ? ColorManager.primary40
                : ColorManager.whiteColor,
            child: Icon(
              isRead ? Icons.notification_add : Icons.notifications_off,
              color: ColorManager.primaryColor,
            ),
          ),

          horizontalSpace(14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  notification.title,

                  style: AppTextStyle.styleBold16(
                    isRead
                        ? ColorManager.textPrimary
                        : ColorManager.primaryColor,
                    context,
                  ),
                ),

                verticalSpace(6),

                Text(
                  notification.body,

                  style: AppTextStyle.styleMedium14(
                    isRead
                        ? ColorManager.textSecondary
                        : ColorManager.primary80,
                    context,
                  ),
                ),

                verticalSpace(10),

                Text(
                  DateFormat(
                    'dd MMM yyyy • hh:mm a',
                  ).format(notification.createdAt),

                  style: AppTextStyle.styleMedium12(
                    isRead
                        ? ColorManager.textSecondary
                        : ColorManager.primary60,
                    context,
                  ),
                ),
              ],
            ),
          ),
          horizontalSpace(14),

          GestureDetector(
            onTap: () {
              context.read<NotificationCubit>().deleteNotification(
                notification.id,
              );
            },
            child: Icon(Icons.delete, color: ColorManager.primary80),
          ),
        ],
      ),
    );
  }
}
