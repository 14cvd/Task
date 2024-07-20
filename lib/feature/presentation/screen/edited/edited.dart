import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/feature/presentation/widget/custom_button.dart';
import 'package:task/feature/presentation/widget/custom_title.dart';
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
              const CustomTitle(title: "Edited"),
              SizedBox(height: 40.h),
              CustomTextFormField(hintText: title),
              SizedBox(height: 40.h),
              CustomTextFormField(hintText: body),
              SizedBox(height: 20.h),
              CustomButton(
                onPressed: () {},
                child: const Text("Edited"),
              )
            ],
          ),
        ));
  }
}
