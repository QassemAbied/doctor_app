import 'package:doctor_app/features/auth/domain/entities/user_entity.dart';

import '../../data/model/user_model.dart';

class UserMapper {
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      email: model.email,
      phone: model.phone,
      image: model.image,
    );
  }
  }
