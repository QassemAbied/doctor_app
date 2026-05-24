import 'package:doctor_app/features/auth/domain/entities/user_entity.dart';
import 'package:doctor_app/features/profile/screens/update_profile/update_profile_body.dart';
import 'package:flutter/material.dart';


class UpdateProfileScreen extends StatelessWidget {
  final UserEntity? userData;

  const UpdateProfileScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personal information'),),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 30, horizontal: 30),
              child: UpdateProfileBody(userData: userData),
            ),
          ),
        ],
      ),
    );
  }
}
