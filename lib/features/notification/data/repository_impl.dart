import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/error/error.dart';
import 'package:doctor_app/features/notification/data/data_source/remote_data_source/local_notification_remote_data_source.dart';
import 'package:doctor_app/features/notification/domain/entity/local_notification_params.dart';
import 'package:doctor_app/features/notification/domain/repository.dart';
import '../domain/entity/local_notification_entities.dart';
import '../domain/mapper/local_notification_mapper.dart';

class LocalNotificationRepositoryImpl implements LocalNotificationRepository {
  final LocalNotificationRemoteDataSource _localNotificationRemoteDataSource;
  LocalNotificationRepositoryImpl(this._localNotificationRemoteDataSource);

  @override
  Future<Either<Failure, void>> addNotification(
    LocalNotificationParams params,
  ) async {
    try {
      await _localNotificationRemoteDataSource.addNotification(params);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NotificationEntity>>> getNotifications() async {
    try {
      final response = await _localNotificationRemoteDataSource
          .getNotifications();
      return Right(NotificationMapper.toEntityList(response));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
