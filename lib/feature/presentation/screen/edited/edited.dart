import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/feature/presentation/widget/text_field.dart';

class EditedScreen extends StatelessWidget {
  const EditedScreen({super.key, this.title, this.body});
  final String? title;
  final String? body;
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
              CustomTextFormField(hintText: title),
              SizedBox(height: 40.h),
              CustomTextFormField(hintText: body),
            ],
          ),
        ));
  }
}
