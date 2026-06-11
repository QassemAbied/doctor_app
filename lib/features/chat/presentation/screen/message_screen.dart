import 'package:doctor_app/core/common_widgets/custom_text_filed.dart';
import 'package:doctor_app/features/chat/presentation/screen/create_new_message_screen.dart';
import 'package:doctor_app/features/chat/presentation/screen/widget/chat_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../controller/chat_cubit.dart';
import 'chat_screen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message'),
        actions: [CreateNewMessageScreen()],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          children: [
            verticalSpace(20),

            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    hintText: 'Search Message',
                    controller: _searchController,
                    onChange: (value) {
                      setState(() {
                        searchText = value.toLowerCase();
                      });
                    },
                    validator: (value) {},
                    prefixIcon: Icon(Icons.search, color: ColorManager.grey60),
                  ),
                ),
                horizontalSpace(12),
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: ColorManager.grey20,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.tune, color: ColorManager.blackColor),
                ),
              ],
            ),

            verticalSpace(24),

            Expanded(
              child: StreamBuilder(
                stream: context.read<ChatCubit>().getAllChats(),

                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final chats = snapshot.data!;
                  final filteredChats = chats.where((chat) {
                    return chat.name.toLowerCase().contains(searchText);
                  }).toList();

                  if (filteredChats.isEmpty) {
                    return Center(
                      child: Text(
                        'No Chats Yet',
                        style: AppTextStyle.styleRegular14(
                          ColorManager.textSecondary,
                          context,
                        ),
                      ),
                    );
                  }

                  return ListView.separated(
                    itemCount: filteredChats.length,

                    separatorBuilder: (_, _) => verticalSpace(18),

                    itemBuilder: (context, index) {
                      final chat = filteredChats[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                receiverId: chat.receiverId,
                                doctorName: chat.name,
                              ),
                            ),
                          );
                        },

                        child: ChatItem(
                          name: chat.name,
                          message: chat.lastMessage,
                          image: chat.image,
                          time: chat.time,
                          isShowTime: true,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
