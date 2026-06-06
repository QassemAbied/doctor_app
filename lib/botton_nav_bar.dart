import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/features/home/presentation/screens/home/home_screen.dart';
import 'package:doctor_app/message_scr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'features/book_appointment/presentation/screen/my_appointment/my_appointment_screen.dart';
import 'features/profile/screens/profile/profile_screen.dart';
import 'features/search/search_view/search_screen.dart';

class BottonNavBarView extends StatefulWidget {
  final int initialIndex;
  const BottonNavBarView({super.key, this.initialIndex = 0});

  @override
  State<BottonNavBarView> createState() => _BottonNavBarViewState();
}

class _BottonNavBarViewState extends State<BottonNavBarView> {
  @override
  void initState() {
    currentIndex=widget.initialIndex;
    super.initState();
  }
  final List<Widget> screens = [
    const HomeScreen(),
    const MessageScr(),
    SearchScreen(),
  MyAppointmentScreen(),

    ProfileScreen(),
  ];
 late int currentIndex ;

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
