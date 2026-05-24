import 'package:doctor_app/features/auth/domain/entities/sign_up_params.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_app/features/profile/screens/update_profile/widget/update_image_profile_widget.dart';
import 'package:doctor_app/features/profile/screens/update_profile/widget/update_profile_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common_widgets/custom_elevated_botton.dart';
import '../../../../core/common_widgets/custom_text_filed.dart';
import '../../../../core/utils/spacing.dart';
import '../../../auth/domain/entities/user_entity.dart';

class UpdateProfileBody extends StatefulWidget {
  final UserEntity? userData;
  const UpdateProfileBody({super.key, this.userData});

  @override
  State<UpdateProfileBody> createState() => _UpdateProfileBodyState();
}

class _UpdateProfileBodyState extends State<UpdateProfileBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  String? imageUrl;
  @override
  void initState() {
    nameController.text = widget.userData?.name ?? '';
    emailController.text = widget.userData?.email ?? '';
    phoneController.text = widget.userData?.phone ?? '';
    genderController.text = widget.userData?.image ?? '';
    imageUrl = widget.userData?.image ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UpdateImageProfileWidget(
          imageUrl: widget.userData?.image,

          onImageUploaded: (image) {
            imageUrl = image;
          },
        ),
        verticalSpace(30),
        AppTextField(
          controller: nameController,
          validator: (_) {},
          hintText: '',
        ),
        verticalSpace(15),
        AppTextField(
          controller: emailController,
          validator: (_) {},
          hintText: '',
        ),
        verticalSpace(15),
        AppTextField(
          controller: phoneController,
          validator: (_) {},
          hintText: '',
        ),
        verticalSpace(15),
        Expanded(child: SizedBox()),
        CustomElevatedButton(
          buttonName: 'Save',
          onPressed: () {
            context.read<AuthCubit>().updateUser(
              UpdateUserParams(
                name: nameController.text,
                email: emailController.text,
                phone: phoneController.text,
                image: imageUrl ?? '',
              ),
            );
          },
        ),

        UpdateProfileBlocListener(),
      ],
    );
  }
}
