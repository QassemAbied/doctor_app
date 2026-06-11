import 'package:doctor_app/features/home/presentation/screens/recommendation_doctor/recommendation_doctor_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/common_widgets/map_smiple.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search'),

        ),
        body: Column(
            children: [
              TabBar(tabs: [
                Tab(text: 'Doctors Name'),
                Tab(text: 'Doctors Map'),
              ]),
              Expanded(
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                  RecommendationDoctorScreen(isShow: false,),
                  MapSample(),
                ]),
              ),

            ]),
      ),
    );
  }
}
