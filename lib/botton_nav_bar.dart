import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_app/features/home/home_view/home_screen.dart';
import 'package:doctor_app/features/search/search_view/search_screen.dart';
import 'package:doctor_app/message_scr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'core/di/dependey.dart';
import 'core/utils/di/injection_container.dart';
import 'features/home/logic/cubit/home_cubit.dart';
import 'features/my_appointment/logic/my_appointment_cubit.dart';
import 'features/my_appointment/view/my_appointment_screen.dart';
import 'features/profile/screens/profile/profile_screen.dart';



class BottonNavBarView extends StatefulWidget {
  const BottonNavBarView({super.key});

  @override
  State<BottonNavBarView> createState() => _BottonNavBarViewState();
}

class _BottonNavBarViewState extends State<BottonNavBarView> {
  final List<Widget> screens = [
    BlocProvider(
      key: const ValueKey('home'),
      create: (context) => getIt<HomeCubit>()..loadHome(),
      child: const HomeScreen(),
    ),
    const MessageScr(),
    BlocProvider(
      key: const ValueKey('search'),
      create: (context) => getIt<HomeCubit>()..loadHome(),
      child: SearchScreen(),
    ),
    BlocProvider(
      create: (context) => getIt<MyAppointmentCubit>()..emitMyAppointment(),
      child: MyAppointmentScreen(),
    ),
    ProfileScreen(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildGestureDetectorIcon('assets/svgs/home-2.svg', 0),
              buildGestureDetectorIcon('assets/svgs/message.svg', 1),
              SizedBox.shrink(),
              buildGestureDetectorIcon('assets/svgs/chat.svg', 3),
              buildGestureDetectorIcon('assets/svgs/icon_app.svg', 4),
            ],
          ),
          Positioned(
            bottom: 25,
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                onPressed: () => onTap(2),
                icon: Icon(Icons.search, color: Colors.white, size: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGestureDetectorIcon(String icon, int index) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: SvgPicture.asset(
        icon,
        height: currentIndex == index ? 25 : 20,
        width: currentIndex == index ? 25 : 20,
        colorFilter: ColorFilter.mode(
          currentIndex == index
              ? ColorManager.primaryColor
              : ColorManager.grey50,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
