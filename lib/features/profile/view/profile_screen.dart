import 'package:doctor_app/core/helpers/extension.dart';
import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/core/theming/app_styles.dart';
import 'package:doctor_app/features/profile/logic/profile_cubit.dart';
import 'package:doctor_app/features/profile/logic/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/di/dependey.dart';
import '../../my_appointment/logic/my_appointment_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Stack(
        children: [
          Container(height: 220, width: double.infinity, color: Colors.blue),
          Column(
            children: [
              const SizedBox(height: 160),

              Expanded(
                child: Container(
                  width: double.infinity,
                  //   padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 0,
                    ),
                    child: BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                       return state.maybeWhen(
                           loading: () {
                             return Center(child: CircularProgressIndicator());
                           },
                           success: (profileResponse){
                             return ListView(children: [
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Text(
                                     profileResponse.data?[0].name??'',
                                     style: AppStyles.styleSemiBold18(
                                         ColorManager.blackColor, context),
                                   ),
                                   Text(
                                     profileResponse.data?[0].email??'',
                                     style: AppStyles.styleMedium14(
                                         ColorManager.geryColor, context),
                                   ),
                                 ],
                               ),
                               verticalSpace(40),
                               buildListTile(
                                   context: context,
                                   image: 'assets/svgs/personal_icon.svg',
                                   text: 'Personal Information',
                                   onTap: () {
                                     context.pushNamed('/UpdateProfileScreen',
                                       arguments: profileResponse,
                                     );
                                   }
                               ),
                               verticalSpace(40),
                               buildListTile(
                                   context: context,
                                   image: 'assets/svgs/my_appointment_icon.svg',
                                   text: 'My Appointment Information',
                                   onTap: () {
                                     context.pushNamed('/myAppointmentsScreen');
                                   }
                               ),
                               verticalSpace(40),

                               buildListTile(
                                   context: context,
                                   image: 'assets/svgs/logout_icon.svg',
                                   text: 'LogOut',
                                   onTap: () {
                                   }
                               ),
                             ]);
                           },
                           error: (error) {
                             return Center(child: Text(error));
                           },
                           orElse: (){
                         return SizedBox.shrink();
                       });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),

          /// Avatar
          Positioned(
            top: 110,
            left: 0,
            right: 0,
            child: Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('assets/images/avater.png'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.edit, size: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    //   Scaffold(
    //   extendBodyBehindAppBar: true,
    //   //backgroundColor: ColorManager.mainBlueColor,
    //   appBar: AppBar(
    //     backgroundColor: ColorManager.mainBlueColor,
    //     elevation: 0,
    //   ),
    //   body: Stack(
    //     alignment: Alignment.topCenter,
    //     children: [
    //       Container(
    //         height: 220,
    //         decoration: BoxDecoration(color: ColorManager.mainBlueColor),
    //       ),
    //
    //       Positioned(
    //         top: 160,
    //         left: 0,
    //         right: 0,
    //         child: Container(
    //          // height: 300,
    //           //height: MediaQuery.of(context).size.height,
    //           decoration: const BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.only(
    //               topLeft: Radius.circular(32),
    //               topRight: Radius.circular(32),
    //             ),
    //           ),
    //           child: SingleChildScrollView(
    //             child: Column(
    //               children: [
    //                 const SizedBox(height:100)
    //                 ,
    //                 Text('ubihnkhi'),
    //                 Text('ubihnkhi'),
    //                 Text('ubihnkhi'),
    //                 Text('ubihnkhi'),
    //                 Text('ubihnkhi'),
    //                 Text('ubihnkhi'),
    //                 Text('ubihnkhi'),
    //                 Text('ubihnkhi'),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         // left: 0,
    //         //right: 0,
    //         top: 110,
    //         child:Stack(
    //           children: [
    //             CircleAvatar(
    //               radius: 55,
    //               backgroundColor: Colors.white,
    //               child: CircleAvatar(
    //                 radius: 50,
    //                 backgroundImage: AssetImage('assets/images/avater.png'),
    //               ),
    //
    //               // Image.asset(
    //               //   'assets/images/avater.png',
    //               //   width: 100,
    //               //   height: 100,
    //               // ),
    //             ),
    //             Positioned(
    //               bottom: 0,
    //               right: 0,
    //               child: CircleAvatar(
    //                 radius: 16,
    //                 backgroundColor: Colors.blue,
    //                 child: const Icon(
    //                   Icons.edit,
    //                   size: 16,
    //                   color: Colors.white,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //
    //
    //
    //     ],
    //   ),
    // );
  }

  Widget buildListTile({
    required BuildContext context,
    required String image,
    required String text,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading: SvgPicture.asset(image),
        title: Text(
          text,
          style: AppStyles.styleMedium16(ColorManager.blackColor, context),
        ),
        onTap: onTap,
      ),
    );
  }
}
