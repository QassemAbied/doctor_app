import 'package:doctor_app/core/widgets/custom_text_filed.dart';
import 'package:doctor_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_app/features/home/logic/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/app_color.dart';
import '../../../core/theming/app_styles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectCategory = 0;
  TextEditingController searchController= TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              current is Loading || current is Success || current is Error,
          builder: (context, state) {
            return state.maybeWhen(
              loading: () {
                return Center(child: CircularProgressIndicator());
              },
              success: (doctors) {
                final allDoctors = doctors;
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            controller: searchController,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                              hintText:  'Search For Doctors',
                              hintStyle: AppStyles.styleMedium14(
                                ColorManager.lightGeryColor,
                                context,
                              ),
                              suffixIcon:searchController.text.isEmpty? null: IconButton(
                                  onPressed: (){

                                    searchController.clear();
                                    context.read<HomeCubit>().searchDoctor('');
                                  },
                                  icon: Icon(Icons.clear),
                              ),

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(
                                  color: ColorManager.lighterGeryColor,
                                  width: 1.3,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: const BorderSide(
                                  color: ColorManager.mainBlueColor,
                                  width: 1.3,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 1.3,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 1.3,
                                ),
                              ),
                            ),
                            onChanged: (value){
                              context.read<HomeCubit>().searchDoctor(value);
                            },
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              final cubit = context.read<HomeCubit>();

                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (context) {
                                  return StatefulBuilder(
                                    builder: (context, setModalState) {
                                      return SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.2,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 30,
                                            horizontal: 10,
                                          ),
                                          child: ListView.builder(
                                            // shrinkWrap: ,
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                cubit.categories.length + 1,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 14,
                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setModalState(() {
                                                      selectCategory = index;
                                                    });
                                                    if (index == 0) {
                                                      cubit.filterByCategory(
                                                        null,
                                                      ); // All
                                                    } else {
                                                      cubit.filterByCategory(
                                                        cubit
                                                            .categories[index -
                                                                1]
                                                            .id,
                                                      );
                                                    }

                                                    Navigator.pop(context);
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    //mainAxisAlignment: MainAxisAlignment.m,
                                                    //crossAxisAlignment: CrossAxisAlignment.,
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: ColorManager
                                                                .blackColor,
                                                            width: 1.4,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                18.0,
                                                              ),
                                                          color:
                                                              selectCategory ==
                                                                  index
                                                              ? ColorManager
                                                                    .mainBlueColor
                                                              : Colors.white,
                                                          //shape: BoxShape.circle
                                                        ),
                                                        padding: EdgeInsets.all(
                                                          10,
                                                        ),
                                                        child: index == 0
                                                            ? Text(
                                                                '  All  ',
                                                                style: AppStyles.styleBold18(
                                                                  selectCategory ==
                                                                          index
                                                                      ? Colors
                                                                            .white
                                                                      : ColorManager
                                                                            .blackColor,
                                                                  context,
                                                                ),
                                                              )
                                                            : Text(
                                                                cubit
                                                                        .categories[index -
                                                                            1]
                                                                        .name ??
                                                                    '',
                                                                style: AppStyles.styleBold18(
                                                                  selectCategory ==
                                                                          index
                                                                      ? Colors
                                                                            .white
                                                                      : ColorManager
                                                                            .blackColor,
                                                                  context,
                                                                ),
                                                              ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            child: SvgPicture.asset(
                              'assets/svgs/sort.svg',
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    Expanded(
                      child: ListView.builder(
                        // shrinkWrap: ,
                        scrollDirection: Axis.vertical,
                        itemCount: allDoctors.length,
                        itemBuilder: (context, index) {
                          // var doctorItem=doctors?[index]?.doctors;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/doctor_image.png',
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                                horizontalSpace(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      allDoctors[index].name ?? '',
                                      style: AppStyles.styleSemiBold16(
                                        ColorManager.blackColor,
                                        context,
                                      ),
                                    ),
                                    verticalSpace(5),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        '${allDoctors[index].gender} - '
                                        '${allDoctors[index].degree}',
                                        style: AppStyles.styleRegular13(
                                          ColorManager.geryColor,
                                          context,
                                        ),
                                      ),
                                    ),
                                    verticalSpace(5),
                                    Text(
                                      '${allDoctors[index].specialization?.name}',
                                      style: AppStyles.styleRegular13(
                                        ColorManager.geryColor,
                                        context,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
              error: (error) {
                return Expanded(child: Text('error'));
              },
              orElse: () {
                return Expanded(child: SizedBox.shrink());
              },
            );
          },
        ),
      ),
    );
  }
}
