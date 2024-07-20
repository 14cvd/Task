import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/feature/presentation/screen/main/provider/user_provider.dart';
import 'package:task/feature/presentation/widget/custom_button.dart';
import 'package:task/feature/presentation/widget/custom_title.dart';
import 'package:task/feature/presentation/widget/text_field.dart';

import '../../../data/dto/users_dto.dart';

// ignore: must_be_immutable
class EditedScreen extends StatefulWidget {
  EditedScreen({super.key, this.title, this.body, required this.index, required this.userProvider});
  final String? title;
  final String? body;
  UserProvider userProvider;
  int index;

  @override
  State<EditedScreen> createState() => _EditedScreenState();
}

class _EditedScreenState extends State<EditedScreen> {
  late final TextEditingController titleController;
  late final TextEditingController bodyController;
  late final UserProvider user;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    bodyController = TextEditingController();
    user = widget.userProvider;
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edited"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CustomTitle(title: "Edited"),
              SizedBox(height: 40.h),
              CustomTextFormField(
                hintText: widget.title,
                controller: titleController,
              ),
              SizedBox(height: 40.h),
              CustomTextFormField(
                hintText: widget.body,
                controller: bodyController,
              ),
              SizedBox(height: 20.h),
              CustomButton(
                onPressed: () async {
                  final editedUser = UserDto(
                    title: titleController.text,
                    body: bodyController.text,
                  );
                  if (titleController.text.isNotEmpty && bodyController.text.isNotEmpty) {
                    await user.editUser(widget.index, editedUser);
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  }
                },
                child: const Text("Edited"),
              )
            ],
          ),
        ));
  }
}
