import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/core/theming/app_styles.dart';
import 'package:doctor_app/core/widgets/app_text_button_widget.dart';
import 'package:doctor_app/core/widgets/custom_text_filed.dart';
import 'package:doctor_app/features/profile/data/models/update_profile_request.dart';
import 'package:doctor_app/features/profile/logic/update_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/profile_response.dart';

class UpdateProfileScreen extends StatefulWidget {
  final ProfileResponse? profileResponse;
  const UpdateProfileScreen({super.key, required this.profileResponse});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController genderController = TextEditingController();
  // late String name = widget.profileResponse?.data?[0].email ?? '';
  // late String email = widget.profileResponse?.data?[0].email ?? '';
  // late String phone = widget.profileResponse?.data?[0].phone ?? '';
  // late String gender = widget.profileResponse?.data?[0].gender ?? '';
  @override
  void initState() {
    nameController.text  = widget.profileResponse?.data?[0].name ?? '';
    emailController.text = widget.profileResponse?.data?[0].email ?? '';
    phoneController.text = widget.profileResponse?.data?[0].phone ?? '';
    genderController.text = widget.profileResponse?.data?[0].gender ?? '';
    super.initState();
  }

  bool showGenderList = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage('assets/images/avater.png'),
                      ),
                    ),
                  ),
                  verticalSpace(30),
                  AppTextFiled(
                    controller: nameController,
                    validator: (_) {},
                    hintText: '',
                  ),
                  verticalSpace(15),
                  AppTextFiled(
                    controller: emailController,
                    validator: (_) {},
                    hintText: '',
                  ),
                  verticalSpace(15),
                  AppTextFiled(
                    controller: phoneController,
                    validator: (_) {},
                    hintText: '',
                  ),
                  verticalSpace(15),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showGenderList = !showGenderList;
                      });
                    },
                    child: AbsorbPointer(
                      child: AppTextFiled(
                        enabled: false,
                        controller: genderController,
                        validator: (_) {},
                        hintText: '',
                      ),
                    ),
                  ),
                  if (showGenderList)
                    Card(
                      child: Container(
                        margin: const EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              _genderItem('Male'),
                              Divider(),
                              _genderItem('Female'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  verticalSpace(15),
                  Expanded(child: SizedBox()),
                  AppTextButtonWidget(buttonName: 'Save', onPressed: () {

                    context.read<UpdateProfileCubit>().emitUpdateProfile(
                        UpdateProfileRequest(
                            nameController.text,
                            emailController.text,
                            phoneController.text,
                            0,
                        )
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _genderItem(String value) {
    return InkWell(
      onTap: () {
        setState(() {
          genderController.text = value;
          showGenderList = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            value,
            style: AppStyles.styleBold16(ColorManager.blackColor, context),
          ),
        ),
      ),
    );
  }
}
