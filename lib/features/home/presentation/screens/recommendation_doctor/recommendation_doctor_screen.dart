import 'package:doctor_app/core/utils/spacing.dart';
import 'package:doctor_app/features/home/presentation/controller/recommendation/recommendation_cubit.dart';
import 'package:doctor_app/features/home/presentation/screens/recommendation_doctor/widget/search_items_widget.dart';
import 'package:doctor_app/features/home/presentation/screens/recommendation_doctor/widget/sort_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common_widgets/custom_text_filed.dart';
import '../../../../../core/theming/app_color.dart';
import '../../../../../core/theming/app_styles.dart';
import 'widget/neabry_doctor_widget.dart';

class RecommendationDoctorScreen extends StatefulWidget {
  const RecommendationDoctorScreen({super.key,  this.isShow= false});
 final bool isShow;

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
      appBar:widget.isShow?
      AppBar(title: Text('Recommendation Doctor')):null,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          controller: searchController,
                          hintText: 'Search',
                          onChange: (value) {
                            context.read<RecommendationCubit>().searchDoctorsByName(
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
                  widget.isShow?  NearbyDoctorWidget(): SizedBox.shrink(),
                  verticalSpace(20),
                  Text(
                    'All Doctors',
                    style: AppTextStyle.styleSemiBold18(
                      ColorManager.textPrimary,
                      context,
                    ),
                  ),
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


