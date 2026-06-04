import 'package:doctor_app/core/utils/spacing.dart';
import 'package:doctor_app/features/home/presentation/controller/doctor/doctors_cubit.dart';
import 'package:doctor_app/features/home/presentation/screens/recommendation_doctor/widget/search_items_widget.dart';
import 'package:doctor_app/features/home/presentation/screens/recommendation_doctor/widget/sort_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common_widgets/custom_text_filed.dart';

class RecommendationDoctorScreen extends StatefulWidget {
  const RecommendationDoctorScreen({super.key});

  @override
  State<RecommendationDoctorScreen> createState() =>
      _RecommendationDoctorScreenState();
}

class _RecommendationDoctorScreenState
    extends State<RecommendationDoctorScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recommendation Doctor')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          controller: searchController,
                          hintText: 'Search',
                          onChange: (value) {
                            context.read<DoctorCubit>().searchDoctorsByName(
                              query: value,
                            );
                          },
                          validator: (String? p1) {
                            if (searchController.text.isEmpty) {
                              return 'Please enter search';
                            }
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showFilterBottomSheet(context);
                        },
                        icon: Icon(Icons.filter_list_rounded),
                      ),
                    ],
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
          ),
          SearchItemsWidget(),
        ],
      ),
    );
  }
}


