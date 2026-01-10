import 'package:doctor_app/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';
import '../../data/models/home_models.dart';



class ListViewForCategory extends StatefulWidget {
  final List<DataHomeModels?>? data;

  const ListViewForCategory({super.key, required this.data});

  @override
  State<ListViewForCategory> createState() => _ListViewForCategoryState();
}

class _ListViewForCategoryState extends State<ListViewForCategory> {
  int selectIndex = 0;
  //bool selectCategoryBool=false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.09,
      child: ListView.builder(
        // shrinkWrap: ,
        scrollDirection: Axis.horizontal,
        itemCount: widget.data?.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 14),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectIndex = index;
                });
                context.read<HomeCubit>().filterByCategory(
                  widget.data?[index]?.id,
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorManager.blackColor,
                        width: 1.4,
                      ),
                      borderRadius: BorderRadius.circular(18.0),
                      color: selectIndex == index
                          ? ColorManager.mainBlueColor
                          : Colors.white,
                      //shape: BoxShape.circle
                    ),
                    padding: EdgeInsets.all(10),
                    child: index == 0
                        ? Text(
                            '  All  ',
                            style: AppStyles.styleBold18(
                              selectIndex == index
                                  ? Colors.white
                                  : ColorManager.blackColor,
                              context,
                            ),
                          )
                        : Text(
                            widget.data?[index]?.name ?? '',
                            style: AppStyles.styleBold18(
                              selectIndex == index
                                  ? Colors.white
                                  : ColorManager.blackColor,
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
    );
  }
}
