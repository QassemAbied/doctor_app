import 'package:doctor_app/features/chat/presentation/screen/widget/chat_item_widget.dart';
import 'package:doctor_app/features/chat/presentation/screen/widget/create_action_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/common_widgets/dummy_data.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/utils/spacing.dart';
import '../../../home/domain/entities/doctor_entity.dart';
import '../../../home/presentation/controller/doctor/doctors_cubit.dart';
import '../../../home/presentation/controller/doctor/doctors_state.dart';
import '../../../home/presentation/screens/home/widgets/empty_doctor_widget.dart';
import 'chat/chat_screen.dart';

class CreateNewMessageScreen extends StatelessWidget {
  const CreateNewMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateActionIconWidget(
      iconData: Icons.add,
      onTap: () {
        showModalBottomSheet(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.6,
            maxWidth: MediaQuery.of(context).size.width,
            minHeight: 0,
            minWidth: 0,
          ),

          context: context,

          builder: (context) {
            return BlocBuilder<DoctorCubit, DoctorState>(
              builder: (context, state) {
                if (state is DoctorError) {
                  return Text(state.message);
                }
                final isLoading = state is DoctorLoading;
                final data = state is DoctorSuccess
                    ? state.doctors
                    : DummyData.fakeDoctors;
                if (!isLoading && data.isEmpty) {
                  return EmptyDoctorsWidget();
                }

                return Skeletonizer(
                  enabled: isLoading,
                  ignoreContainers: true,
                  child: Container(
                    padding: const EdgeInsets.all(24),

                    decoration: const BoxDecoration(
                      color: ColorManager.whiteColor,

                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(32),
                      ),
                    ),

                    child: ListViewForCreateMessage(data: data),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

class ListViewForCreateMessage extends StatelessWidget {
  const ListViewForCreateMessage({super.key, required this.data});

  final List<DoctorEntity> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      child: ListView.separated(
        itemCount: data.length,
        separatorBuilder: (_, _) => verticalSpace(18),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ChatScreen(
                      receiverId: data[index].id,
                      doctorName: data[index].name,
                    );
                  },
                ),
              );
            },
            child: ChatItem(
              name: data[index].name,
              message: '${data[index].gender} - ${data[index].degree}',
              image: data[index].image,
              time: '',
              isShowTime: false,
            ),
          );
        },
      ),
    );
  }
}
